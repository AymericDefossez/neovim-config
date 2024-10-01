local map = vim.keymap.set
local opts = require("mappings.default_opts")

map({ "n", "v" }, "<C-c>", '"+y', opts)
map({ "n", "v" }, "<C-x>", '"+x', opts)
map({ "n", "v" }, "<C-v>", '"+p', opts)
