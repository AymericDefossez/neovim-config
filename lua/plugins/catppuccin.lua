return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    local catppuccin_config = require("configs.catppuccin_configs")

    require("catppuccin").setup(catppuccin_config)
    require("options.catppuccin_options")
  end
}
