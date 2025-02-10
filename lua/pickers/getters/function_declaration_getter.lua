local function build_function_signature(name_node, params_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local params = params_node and vim.treesitter.get_node_text(params_node, bufnr) or "()"
  local return_type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  return string.format("%s%s%s", name, params, return_type)
end

local function get_function_declarations()
  local parser = vim.treesitter.get_parser(0, vim.bo.filetype)
  local tree = parser:parse()[1]
  local root = tree:root()

  local function_declarations = {}
  local function_declaration_query = vim.treesitter.query.parse(
    vim.bo.filetype,
    [[
    (function_declaration
      name: (identifier) @name
      parameters: (formal_parameters) @parameters
      return_type: (type_annotation)? @return_type)
    ]]
  )

  for _, match, _ in function_declaration_query:iter_matches(root, 0) do
    local name_node = match[1]
    local params_node = match[2]
    local type_node = match[3]
    local signature = build_function_signature(name_node, params_node, type_node, 0)
    local range = { name_node:range() }

    print("Find function: " .. signature .. " at " .. range[1] .. ":" .. range[2])
    table.insert(function_declarations, {
      name = signature,
      line = range[1] + 1,
      path = vim.api.nvim_buf_get_name(0),
    })
  end

  return function_declarations
end

return {
  get_function_declarations = get_function_declarations,
}
