return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree_config = require("configs.neotree_configs")

    require("neo-tree").setup(neotree_config)
    require("mappings.neotree_mappings")
  end
}
