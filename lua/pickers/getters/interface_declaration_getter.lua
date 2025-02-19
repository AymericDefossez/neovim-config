local function build_interface_signature(name_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)

  return string.format("Interface: %s", name)
end

local query = [[
  (interface_declaration
    name: (type_identifier) @name)
  ]]

local function get_interface_declarations(match)
  local name_node = match[1]
  local signature = build_interface_signature(name_node, 0)
  local range = { name_node:range() }

  print("Find interface: " .. signature .. " at " .. range[1] .. ":" .. range[2])
  return {
    name = signature,
    line = range[1] + 1,
    path = vim.api.nvim_buf_get_name(0),
  }
end

return {
  title = "Interfaces",
  query = query,
  get_definitions = get_interface_declarations,
}
