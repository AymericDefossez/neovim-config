local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("v", "<C-c>", '"+y', opts)
map("v", "<C-x>", '"+x', opts)
map("i", "<C-v>", '"+p', opts)
