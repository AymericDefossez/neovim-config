return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function ()
    local surround_config = require("configs.surround_configs")
    require("nvim-surround").setup(surround_config)
  end
}
