local function build_function_signature(name_node, params_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local params = params_node and vim.treesitter.get_node_text(params_node, bufnr):gsub("[%s\r\n]+", " ") or "()"
  local return_type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  return string.format("%s%s%s", name, params, return_type)
end

local query = [[
  (function_declaration
    name: (identifier) @name
    parameters: (formal_parameters) @parameters
    return_type: (type_annotation)? @return_type)
  ]]

local function get_function_declarations(match)
  local name_node = match[1]
  local params_node = match[2]
  local type_node = match[3]
  local signature = build_function_signature(name_node, params_node, type_node, 0)
  local range = { name_node:range() }

  print("Find function: " .. signature .. " at " .. range[1] .. ":" .. range[2])
  return {
    name = signature,
    line = range[1] + 1,
    path = vim.api.nvim_buf_get_name(0),
  }
end

return {
  title = "Functions",
  query = query,
  get_definitions = get_function_declarations,
}
