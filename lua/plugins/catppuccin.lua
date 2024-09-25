return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    local catpuccin_config = require("configs.catppuccin")
    require("catppuccin").setup(cappuccin_config)

    vim.cmd("colorscheme catppuccin")
  end
}
