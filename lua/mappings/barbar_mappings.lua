local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map({ "n", "i" }, "<A-Right>", "<Cmd>BufferNext<CR>", opts)
map({ "n", "i" }, "<A-Left>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>blc", "<Cmd>BufferCloseBuffersRight<CR>", opts)
map("n", "<leader>bhc", "<Cmd>BufferCloseBuffersLeft<CR>", opts)
map("n", "<leader>bbc", "<Cmd>BufferCloseAllButCurrent<CR>", opts)

map("n", "<C-k>w", function()
	vim.cmd("BufferCloseAllButPinned")
	vim.cmd("Alpha")
end, opts)
