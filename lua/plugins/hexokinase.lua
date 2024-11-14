return {
  "RRethy/vim-hexokinase",
  name = "css_color",
  build = "make hexokinase",
  config = function()
    vim.g.Hexokinase_highlighters = { "virtual" }
    vim.cmd("set termguicolors")
  end,
}
