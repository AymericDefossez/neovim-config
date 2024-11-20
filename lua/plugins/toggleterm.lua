return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()
    require("mappings.toggleterm_mappings")
  end,
}
