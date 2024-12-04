return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine_configs = require("configs.lualine_configs")
    require("lualine").setup(lualine_configs)
  end,
}
