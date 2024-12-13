local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}

local function build_function_signature(name_node, accessor_node, params_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local accessor = accessor_node and vim.treesitter.get_node_text(accessor_node, bufnr) or ""
  local params = params_node and vim.treesitter.get_node_text(params_node, bufnr) or "()"
  local return_type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  print("name: " .. name .. ", accessor: " .. accessor .. ", params: " .. params .. ", type: " .. return_type)

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
  local parser = vim.treesitter.get_parser(0)
  local tree = parser:parse()[1]
  local root = tree:root()

  local functions = {}
  local query = vim.treesitter.query.parse(
    vim.bo.filetype,
    [[
    ; Capturer les déclarations de fonctions
    ;(function_declaration
    ;  (accessibility_modifier) @accessor
    ;  name: (identifier) @name
    ;  parameters: (formal_parameters) @params
    ;  type: (type_annotation)? @type)

    ; Capturer les méthodes dans les classes
    (method_definition
      (accessibility_modifier)? @accessor
      name: (property_identifier) @name
      parameters: (formal_parameters) @parameters
      return_type: (type_annotation)? @return_type)
    ]]
  )

  for _, match in query:iter_matches(root, 0) do
    local accessor_node = match[1]
    local name_node = match[2]
    local params_node = match[3]
    local type_node = match[4]
    local signature = build_function_signature(name_node, accessor_node, params_node, type_node, 0)

    local range = { name_node:range() }
    print("Function: " .. signature .. " at " .. range[1] .. ":" .. range[2])
    table.insert(functions, {
      name = signature,
      line = range[1] + 1,
      col = range[2] + 1,
    })
  end

  return functions
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
