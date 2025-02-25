local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "<leader>ss", "<Cmd>SessionSearch<CR>", opts("Search session files"))
