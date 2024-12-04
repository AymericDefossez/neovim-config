local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "<leader>gd", "<Cmd>Gitsigns preview_hunk<CR>", opts)
