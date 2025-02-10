local function build_field_signature(name_node, accessor_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local accessor = accessor_node and vim.treesitter.get_node_text(accessor_node, bufnr) .. " " or ""
  local type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  return string.format("%s%s%s", accessor, name, type)
end

local function get_field_definitions()
  local parser = vim.treesitter.get_parser(0, vim.bo.filetype)
  local tree = parser:parse()[1]
  local root = tree:root()

  local field_definitions = {}
  local field_definition_query = vim.treesitter.query.parse(
    vim.bo.filetype,
    [[
    (public_field_definition
      (accessibility_modifier)? @accessor
      name: (property_identifier) @name
      type: (type_annotation)? @type)
    ]]
  )

  for _, match, _ in field_definition_query:iter_matches(root, 0) do
    local accessor_node = match[1]
    local name_node = match[2]
    local type_node = match[3]
    local signature = build_field_signature(name_node, accessor_node, type_node, 0)
    local range = { name_node:range() }

    print("Find field: " .. signature .. " at " .. range[1] .. ":" .. range[2])
    table.insert(field_definitions, {
      name = signature,
      line = range[1] + 1,
      path = vim.api.nvim_buf_get_name(0),
    })
  end

  return field_definitions
end

return {
  get_field_definitions = get_field_definitions,
}
