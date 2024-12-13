local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader><Esc>", "<Cmd>noh<CR>", opts)

map("n", "<C-k>o", function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    }
  })
end, opts)
