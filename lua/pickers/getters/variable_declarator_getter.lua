local table_has_value = require("utils.table_has_value")

local exclude_parent_types = {
  "class_declaration",
  "arrow_function",
  "function_declaration",
}

local function build_variable_signature(name_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  return string.format("Variable: %s%s", name, type)
end

local query = [[
  (variable_declarator
    name: (identifier) @name
    type: (type_annotation)? @type)
  ]]

local function get_variable_declarators(match)
  local name_node = match[1]
  local type_node = match[2]
  local signature = build_variable_signature(name_node, type_node, 0)
  local range = { name_node:range() }

  local parent = name_node:parent()
  local parent_is_class_declaration = false
  while parent do
    local parent_type = parent:type()
    if table_has_value(exclude_parent_types, parent_type) then
      parent_is_class_declaration = true
      break
    end
    parent = parent:parent()
  end

  if parent_is_class_declaration then return {} end

  -- print("Find variable: " .. signature .. " at " .. range[1] .. ":" .. range[2])
  return {
    name = signature,
    line = range[1] + 1,
    col = range[2] + 1,
    path = vim.api.nvim_buf_get_name(0),
  }
end

return {
  title = "Variables",
  query = query,
  get_definitions = get_variable_declarators,
  name_node_index = 1,
}
