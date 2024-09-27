return {
  "goolord/alpha-nvim",
  config = function()
    local alpha_config = require("configs.alpha")

    require("alpha").setup(alpha_config)
  end
}
