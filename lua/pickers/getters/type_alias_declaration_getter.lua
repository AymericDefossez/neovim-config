local function build_type_signature(name_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)

  return string.format("Type: %s", name)
end

local query = [[
  (type_alias_declaration
    name: (type_identifier) @name)
  ]]

local function get_type_alias_declarations(match)
  local name_node = match[1]
  local signature = build_type_signature(name_node, 0)
  local range = { name_node:range() }

  -- print("Find type: " .. signature .. " at " .. range[1] .. ":" .. range[2])
  return {
    name = signature,
    line = range[1] + 1,
    col = range[2] + 1,
    path = vim.api.nvim_buf_get_name(0),
  }
end

return {
  title = "Types",
  query = query,
  get_definitions = get_type_alias_declarations,
  name_node_index = 1,
}
