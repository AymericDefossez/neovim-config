local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")
local builtin = require('telescope.builtin')

map('n', '<leader>ff', builtin.find_files, opts("Find files"))
map('n', '<leader>fg', builtin.live_grep, opts("Find grep"))
map('n', '<leader>fb', builtin.buffers, opts("Find buffers"))
map('n', '<leader>fh', builtin.help_tags, opts("Find help tags"))
map('n', '<leader>fq', builtin.quickfix, opts("Find quickfix"))

map('n', '<leader>fr', builtin.lsp_references, opts("Find references"))
map('n', '<leader>fd', builtin.lsp_definitions, opts("Find definitions"))
map('n', '<leader>fi', builtin.lsp_implementations, opts("Find implementations"))

map('n', '<leader>fs', function()
  local authorized_file_types = { 'typescript' }
  if not vim.tbl_contains(authorized_file_types, vim.bo.filetype) then return end
  require("pickers.signatures_picker").signatures_picker()
end, opts("Find signatures"))

map('n', '<leader>fS', function ()
  require("pickers.not_documented_block_picker").signatures_picker()
end, opts("Find signatures without documentation"))
