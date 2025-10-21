local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "-", "<cmd>Oil --float<CR>", opts("Open Oil float window"))

return {
  "stevearc/oil.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  opts = {
    float = {
      preview_split = "right",
      border = "rounded",
    },
    keymaps = {
      ["<esc>"] = function ()
        if not vim.bo.modified then
          require("oil").close()
        else
          vim.notify("Des modifications non enregistrées existent.")
        end
      end,
    },
  },
}
