return {
  "goolord/alpha-nvim",
  config = function()
    local opts = require("configs.alpha_configs")
    require("alpha").setup(opts)
  end
}
