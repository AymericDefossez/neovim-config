return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    local treesitter_config = require("configs.treesitter_configs")
    treesitter.setup(treesitter_config)
  end,
}
