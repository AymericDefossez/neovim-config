local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("v", "<C-c>", '"+y', opts("Copy to clipboard"))
map("v", "<C-x>", '"+x', opts("Cut to clipboard"))
map("i", "<C-v>", '"+p', opts("Paste from clipboard"))
