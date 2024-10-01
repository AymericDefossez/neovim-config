local map = vim.keymap.set
local opts = require("mappings.default_opts")

map("n", "<leader>e", "<cmd>Neotree focus reveal<cr>", opts)
