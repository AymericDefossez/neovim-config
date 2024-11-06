return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local telescope_config = require("configs.telescope_configs")
    telescope.setup(telescope_config)
    telescope.load_extension("ui-select")
    require("mappings.telescope_mappings")
  end,
}
