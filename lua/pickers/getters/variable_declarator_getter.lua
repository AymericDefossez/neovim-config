local function build_variable_signature(name_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  return string.format("%s%s", name, type)
end

local function get_variable_declarators()
  local parser = vim.treesitter.get_parser(0, vim.bo.filetype)
  local tree = parser:parse()[1]
  local root = tree:root()

  local variable_declarators = {}
  local variable_declarator_query = vim.treesitter.query.parse(
    vim.bo.filetype,
    [[
    (variable_declarator
      name: (identifier) @name
      type: (type_annotation)? @type)
    ]]
  )

  for _, match, _ in variable_declarator_query:iter_matches(root, 0) do
    local name_node = match[1]
    local type_node = match[2]
    local signature = build_variable_signature(name_node, type_node, 0)
    local range = { name_node:range() }

    print("Find variable: " .. signature .. " at " .. range[1] .. ":" .. range[2])
    table.insert(variable_declarators, {
      name = signature,
      line = range[1] + 1,
      path = vim.api.nvim_buf_get_name(0),
    })
  end

  return variable_declarators
end

return {
  get_variable_declarators = get_variable_declarators,
}
