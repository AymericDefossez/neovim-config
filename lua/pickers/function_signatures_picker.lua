local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values

local M = {}

local function build_function_signature(name_node, accessor_node, params_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local accessor = accessor_node and vim.treesitter.get_node_text(accessor_node, bufnr) or ""
  local params = params_node and vim.treesitter.get_node_text(params_node, bufnr) or "()"
  local return_type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  if accessor ~= "" and return_type ~= "" then
    return string.format("%s %s%s%s", accessor, name, params, return_type)
  elseif accessor ~= "" then
    return string.format("%s %s%s", accessor, name, params)
  elseif return_type ~= "" then
    return string.format("%s%s%s", name, params, return_type)
  else
    return string.format("%s%s", name, params)
  end
end

local function get_functions()
  local parser = vim.treesitter.get_parser(0, vim.bo.filetype)
  local tree = parser:parse()[1]
  local root = tree:root()

  local functions = {}
  local method_definition_query = vim.treesitter.query.parse(
    vim.bo.filetype,
    [[
    (method_definition
      (accessibility_modifier)? @accessor
      name: (property_identifier) @name
      parameters: (formal_parameters) @parameters
      return_type: (type_annotation)? @return_type)
    ]]
  )

  for _, match, _ in method_definition_query:iter_matches(root, 0) do
    local accessor_node = match[1]
    local name_node = match[2]
    local params_node = match[3]
    local type_node = match[4]
    local signature = build_function_signature(name_node, accessor_node, params_node, type_node, 0)
    local range = { name_node:range() }

    print("Find function: " .. signature .. " at " .. range[1] .. ":" .. range[2])
    table.insert(functions, {
      name = signature,
      line = range[1] + 1,
      col = range[2] + 1,
      bufnr = vim.api.nvim_get_current_buf(),
      path = vim.api.nvim_buf_get_name(0),
      filetype = vim.bo.filetype,
    })
  end

  return functions
end

local function preview_function(self, entry)
  -- print("Preview function: " .. entry.value.name .. " on bufnr " .. self.state.bufnr)
  local utils = require("telescope.previewers.utils")

  print("bun_name: " .. vim.api.nvim_buf_get_name(self.state.bufnr) .. " entry.path: " .. entry.value.path)
  if vim.api.nvim_buf_get_name(self.state.bufnr) ~= entry.value.path then
    conf.buffer_previewer_maker(entry.value.path, self.state.bufnr)
  end

  vim.defer_fn(function()
    if vim.api.nvim_buf_is_loaded(self.state.bufnr) then
      vim.api.nvim_buf_call(self.state.bufnr, function()
        local total_lines = vim.api.nvim_buf_line_count(self.state.bufnr)
        local target_line = math.max(0, math.min(entry.value.line - 1, total_lines - 1))
        vim.api.nvim_buf_add_highlight(self.state.bufnr, -1, "Search", target_line, 0, -1)
      end)
      utils.highlighter(self.state.bufnr, entry.value.filetype)
      vim.api.nvim_win_set_cursor(self.state.winid, { entry.value.line, 0 })
    end
  end, 50)
end

M.function_picker = function(opts)
  opts = opts or {}
  local functions = get_functions()

  pickers.new(opts, {
    prompt_title = "Functions",
    finder = finders.new_table({
      results = functions,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.name,
        }
      end
    }),
    sorter = conf.generic_sorter(opts),
    previewer = previewers.new_buffer_previewer({
      title = "Function Preview",
      define_preview = preview_function,
    }),
    attach_mappings = function(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_win_set_cursor(0, { selection.value.line, selection.value.col })
      end)

      return true
    end
  }):find()
end

return M
