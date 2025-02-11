local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local max_line = vim.api.nvim_buf_line_count(0)

local M = {}

local signatures_types = {
  method_definition = require("pickers.getters.method_definition_getter"),
  field_definition = require("pickers.getters.field_definition_getter"),
  function_declaration = require("pickers.getters.function_declaration_getter"),
  -- variable_declarator = require("pickers.getters.variable_declarator_getter"),
}

local function get_signatures()
  local signatures = {}

  local parser = vim.treesitter.get_parser(0, vim.bo.filetype)
  local tree = parser:parse()[1]
  local root = tree:root()

  for type, data in pairs(signatures_types) do
    print("looping on " .. type)
    local treesitter_query = vim.treesitter.query.parse(vim.bo.filetype, data.query)
    for _, match, _ in treesitter_query:iter_matches(root, 0) do
      local definition = data.get_definitions(match)
      if definition.line < 0 or definition.line > max_line then
        print("definition out of range: " .. definition.name .. " -> " .. definition.line)
        definition.line = max_line
      end
      table.insert(signatures, definition)
    end
  end

  -- print("signatures: " .. vim.inspect(signatures))
  return signatures
end

M.signatures_picker = function(opts)
  opts = opts or {}
  local signatures = get_signatures()

  table.sort(signatures, function(a, b)
    return a.line < b.line
  end)

  for i, sig in ipairs(signatures) do
    if type(sig.line) ~= "number" then
      print("⚠️ Problème de type détecté à l'index", i, ":", sig.name, "->", sig.line)
      sig.line = tonumber(sig.line) or 1  -- Forcer en nombre
    end
  end

  pickers.new(opts, {
    prompt_title = "Functions",
    finder = finders.new_table({
      results = signatures,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.line,
          path = entry.path,
          lnum = math.min(entry.line or 1, max_line),
        }
      end
    }),
    -- sorter = conf.generic_sorter(opts),
    previewer = conf.grep_previewer(opts),
    attach_mappings = function(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_win_set_cursor(0, { selection.value.line, 0 })
      end)

      return true
    end
  }):find()
end

return M
