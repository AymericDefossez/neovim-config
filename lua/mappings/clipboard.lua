local map = vim.keymap.set

map({ "n", "v" }, "<C-c>", '"+y')
map({ "n", "v" }, "<C-x>", '"+x')
map({ "n", "v" }, "<C-v>", '"+p')
