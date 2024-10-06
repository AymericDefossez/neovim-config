return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    local catppuccin_config = require("configs.catppuccin")

    require("catppuccin").setup(catppuccin_config)
    require("options.catppuccin")
  end
}
