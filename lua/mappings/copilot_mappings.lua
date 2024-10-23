local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("i", "<C-l>", "<Plug>(copilot-accept-word)", opts)
