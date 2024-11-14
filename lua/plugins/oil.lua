return {
  "stevearc/oil.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local oil = require("oil")
    local oil_configs = require("configs.oil_configs")

    oil.setup(oil_configs)
    require("mappings.oil_mappings")
  end,
}
