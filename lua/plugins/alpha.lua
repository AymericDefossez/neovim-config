return {
  "goolord/alpha-nvim",
  config = function()
    local alpha_config = require("configs.alpha_configs")

    require("alpha").setup(alpha_config)
  end
}
