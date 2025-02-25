local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")

map("n", "<C-h>", "<C-w>h", opts("Go to the left window"))
map("n", "<C-j>", "<C-w>j", opts("Go to the bottom window"))
map("n", "<C-k>", "<C-w>k", opts("Go to the top window"))
map("n", "<C-l>", "<C-w>l", opts("Go to the right window"))
map("n", "<leader><Esc>", "<Cmd>noh<CR>", opts("Clear search highlights"))

map("n", "<leader>ci", function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    }
  })
end, opts("Remove unused imports"))
