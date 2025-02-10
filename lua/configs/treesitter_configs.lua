local ensured_installed = { "lua", "html", "css", "typescript", "javascript", "jsdoc", "query" }

return {
  ensure_installed = ensured_installed,
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    enable = true,
  }
}
