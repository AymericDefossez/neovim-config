local opts = {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
  hint_enable = false,
}

return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_signature").setup(opts)
  end,
}
