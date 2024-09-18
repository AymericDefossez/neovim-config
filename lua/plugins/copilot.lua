return {
  'github/copilot.vim',
  name = 'Copilot',
  config = function ()
    local map = vim.keymap.set
    map('i', '<C-Right>', '<Plug>(copilot-accept-word)')
  end
}
