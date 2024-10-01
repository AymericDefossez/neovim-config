local map = vim.keymap.set
local opts = require("mappings.default_opts")

map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>blc", "<Cmd>BufferCloseBuffersRight<CR>", opts)
map("n", "<leader>bhc", "<Cmd>BufferCloseBuffersLeft<CR>", opts)
map("n", "<leader>bbc", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
map("n", "<C-k>w", "<Cmd>BufferCloseAllButPinned<CR>", opts)
