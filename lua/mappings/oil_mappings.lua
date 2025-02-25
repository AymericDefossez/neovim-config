local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "-", "<cmd>Oil --float<CR>", opts("Open Oil float window"))
