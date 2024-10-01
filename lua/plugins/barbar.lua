
return {
  "romgrk/barbar.nvim",
  version = "^1.0.0",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    local barbar_config = require("configs.barbar")

    require("barbar").setup(barbar_config)
    require("mappings.barbar")
  end,
}
