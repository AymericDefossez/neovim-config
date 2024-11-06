return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    local treesitter_config = require("configs.treesitter_configs")
    treesitter.setup(treesitter_config)
  end,
}
