return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    config = function()
      local map = vim.keymap.set
      local opts = { silent = true }
      map("n", "<leader>e", ":Neotree focus left reveal<cr>", opts)
      map("n", "<C-m>", ":Neotree toggle left reveal<cr>", opts)
    end
  }
}
