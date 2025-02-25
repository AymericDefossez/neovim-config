local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "<leader>gh", "<Cmd>Gitsigns preview_hunk<CR>", opts("Preview github hunk"))
