local function build_field_signature(name_node, accessor_node, type_node, bufnr)
  local name = vim.treesitter.get_node_text(name_node, bufnr)
  local accessor = accessor_node and vim.treesitter.get_node_text(accessor_node, bufnr) .. " " or ""
  local type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or ""

  return string.format("Field: %s%s%s", accessor, name, type)
end

local query = [[
  (public_field_definition
    (accessibility_modifier)? @accessor
    name: (property_identifier) @name
    type: (type_annotation)? @type)
  ]]

local function get_field_definitions(match)
  local accessor_node = match[1]
  local name_node = match[2]
  local type_node = match[3]
  local signature = build_field_signature(name_node, accessor_node, type_node, 0)
  local range = { name_node:range() }

  -- print("Find field: " .. signature .. " at " .. range[1] .. ":" .. range[2])
  return {
    name = signature,
    line = range[1] + 1,
    col = range[2] + 1,
    path = vim.api.nvim_buf_get_name(0),
  }
end

return {
  title = "Fields",
  query = query,
  get_definitions = get_field_definitions,
  name_node_index = 2,
}
