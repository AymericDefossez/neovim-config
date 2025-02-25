local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map({ "n", "i" }, "<A-Right>", "<Cmd>BufferNext<CR>", opts("Go to the next buffer"))
map({ "n", "i" }, "<A-Left>", "<Cmd>BufferPrevious<CR>", opts("Go to the previous buffer"))
map({ "n", "i" }, "<C-A-Right>", "<Cmd>BufferMoveNext<CR>", opts("Move the current buffer to the right"))
map({ "n", "i" }, "<C-A-Left>", "<Cmd>BufferMovePrevious<CR>", opts("Move the current buffer to the left"))
map("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts("Close the current buffer"))
map("n", "<leader>brc", "<Cmd>BufferCloseBuffersRight<CR>", opts("Close all buffers to the right"))
map("n", "<leader>blc", "<Cmd>BufferCloseBuffersLeft<CR>", opts("Close all buffers to the left"))
map("n", "<leader>bbc", "<Cmd>BufferCloseAllButCurrent<CR>", opts("Close all buffers except the current one"))

map("n", "<leader>co", function()
	vim.cmd("BufferCloseAllButPinned")
	vim.cmd("Alpha")
end, opts("Close all buffers"))
