return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope_config = require("configs.telescope")
    require("telescope").setup(telescope_config)
    require("mappings.telescope")
  end,
}
