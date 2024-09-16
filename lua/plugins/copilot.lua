return {
  'github/copilot.vim',
  name = 'Copilot',
  config = function ()
    local map = vim.keymap.set
    -- Add map to accept the next suggested word bind to ctrl+right
    map('i', '<C-Right>', '<Plug>(copilot-accept-word)')
  end
}
