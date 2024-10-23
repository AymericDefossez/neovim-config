return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local telescope_config = require("configs.telescope_configs")
      telescope.setup(telescope_config)
      telescope.load_extension("fzf")
      require("mappings.telescope_mappings")
    end,
  },
}
