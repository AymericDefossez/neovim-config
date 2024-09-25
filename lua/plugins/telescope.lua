return {
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local builtin = require("telescope.builtin")
      local map = vim.keymap.set
      map("n", "<leader>ff", builtin.find_files, {})
      map("n", "<leader>fg", builtin.live_grep, {})
      map("n", "<leader>fb", builtin.buffers, {})
      map("n", "<leader>fh", builtin.help_tags, {})
      map("n", "<leader>fq", builtin.quickfix, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          path_display = { "smart" },
          dynamic_preview_title = true,
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })
      telescope.load_extension("ui-select")
    end
  }
}

