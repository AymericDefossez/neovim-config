local utils = require("utils")
local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>q<cr>")
map("n", "<leader>qa", "<cmd>qa<cr>")
map("n", "<leader>w", "<cmd>w<cr>")

-- Barbar keymap setup
local barbar_opts = { silent = true }
local function dsc(description)
  return utils.merge_tables(barbar_opts, { description = description })
end

map({"n", "i"}, "<A-Left>", "<cmd>BufferPrevious<cr>", dsc("Go to the previous tab"))
map({"n", "i"}, "<A-Right>", "<cmd>BufferNext<cr>", dsc("Go to the next tab"))

for i=1,10 do
  map("n", "<leader>" .. (i % 10), "<cmd>BufferGoto " .. i .. "<cr>", dsc("Go to the tab " .. i))
end

map("n", "<c-,>", "<cmd>BufferMovePrevious<cr>", dsc("Move tab to left"))
map("n", "<c-.>", "<cmd>BufferMoveNext<cr>", dsc("Move tab to right"))

map("n", "<c-<>", "<cmd>BufferScrollLeft<cr>", dsc("Scroll tab to left"))
map("n", "<c->>", "<cmd>BufferScrollRight<cr>", dsc("Scroll tab to right"))

map({"n", "v", "i"} , "<s-<ScrollWheelUp>>", "zh", dsc("Scroll tab to left"))
map({"n", "v", "i"} , "<s-<ScrollWheelDown>>", "zl", dsc("Scroll tab to right"))

map("n", "<leader>bc", "<cmd>BufferClose<cr>", dsc("Close the current tab"))
map("n", "<leader>bhc", "<cmd>BufferCloseBuffersLeft<cr>", dsc("Close the left tabs"))
map("n", "<leader>blc", "<cmd>BufferCloseBuffersRight<cr>", dsc("Close the right tabs"))

map("n", "<leader>bp", "<cmd>BufferPin<cr>", dsc("Pin/Unpin the current tab"))
map("n", "<leader>bbc", "<cmd>BufferCloseAllButCurrent<cr>", dsc(""))
map("n", "<c-k>w", function()
  vim.cmd("BufferCloseAllButPinned")
  vim.cmd("Alpha")
end, dsc("Close all tabs"))

map("n", "<leader><esc>", "<cmd>noh<cr>", dsc("Clear search highlights"))

map("v", "<C-c>", '"+y', dsc("Copy to clipboard"))
map("n", "<C-v>", '"+p', dsc("Paste from clipboard"))

map("n", "<c-h>", "<c-w>h", dsc("Move to the left window"))
map("n", "<c-j>", "<c-w>j", dsc("Move to the bottom window"))
map("n", "<c-k>", "<c-w>k", dsc("Move to the top window"))
map("n", "<c-l>", "<c-w>l", dsc("Move to the right window"))
