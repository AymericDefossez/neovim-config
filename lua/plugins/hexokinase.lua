return {
  "RRethy/vim-hexokinase",
  build = "make hexokinase",
  config = function()
    vim.g.Hexokinase_highlighters = { "virtual" }
    vim.cmd("set termguicolors")
  end,
}
