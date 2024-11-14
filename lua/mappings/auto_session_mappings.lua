local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "<leader>fs", "<Cmd>SessionSearch<CR>", opts)
