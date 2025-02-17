local function build_method_signature(name_node, accessor_node, params_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local accessor = accessor_node and vim.treesitter.get_node_text(accessor_node, bufnr) .. " " or ""
  local params = params_node and vim.treesitter.get_node_text(params_node, bufnr):gsub("[%s\r\n]+", " ") or "()"
  local return_type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  return string.format("%s%s%s%s", accessor, name, params, return_type)
end

local query = [[
  (method_definition
    (accessibility_modifier)? @accessor
    name: (property_identifier) @name
    parameters: (formal_parameters) @parameters
    return_type: (type_annotation)? @return_type)
  ]]

local function get_method_definitions(match)
  local accessor_node = match[1]
  local name_node = match[2]
  local params_node = match[3]
  local type_node = match[4]
  local signature = build_method_signature(name_node, accessor_node, params_node, type_node, 0)
  local range = { name_node:range() }

  print("Find method: " .. signature .. " at " .. range[1] .. ":" .. range[2])
  return {
    name = signature,
    line = range[1] + 1,
    path = vim.api.nvim_buf_get_name(0),
  }
end

return {
  title = "Methods",
  query = query,
  get_definitions = get_method_definitions,
}
