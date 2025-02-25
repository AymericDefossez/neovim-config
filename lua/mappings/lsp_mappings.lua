local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "<leader>ca", vim.lsp.buf.code_action, opts("View code actions"))
