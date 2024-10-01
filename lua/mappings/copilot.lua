local map = vim.keymap.set
local opts = require("mappings.default_opts")

map("i", "<C-Right>", "<Plug>(copilot-accept-word)", opts)
