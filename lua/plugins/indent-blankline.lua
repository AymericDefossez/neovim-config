return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local indent_blankline_config = require("configs.indent-blankline_configs")
    require("ibl").setup(indent_blankline_config)
  end,
}
