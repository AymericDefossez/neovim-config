local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map('n', '<leader>t', '<Cmd>ToggleTerm direction=float<CR>', opts("Open terminal"))
map('t', '<C-x>', '<Cmd>ToggleTermToggleAll<CR>', opts("Close terminal"))
