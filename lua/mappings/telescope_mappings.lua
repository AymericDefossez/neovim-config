local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")
local builtin = require('telescope.builtin')

map('n', '<leader>ff', builtin.find_files, opts)
map('n', '<leader>fg', builtin.live_grep, opts)
map('n', '<leader>fb', builtin.buffers, opts)
map('n', '<leader>fh', builtin.help_tags, opts)

map('n', '<leader>fr', builtin.lsp_references, opts)
map('n', '<leader>fd', builtin.lsp_definitions, opts)
map('n', '<leader>fi', builtin.lsp_implementations, opts)
