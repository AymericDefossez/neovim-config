return {
  'joeveiga/ng.nvim',
  name = 'ng',
  config = function()
    local opts = { noremap = true, silent = true }
    local ng = require('ng')
    local map = vim.keymap.set

    map('n', '<leader>at', ng.goto_template_for_component, opts)
    map('n', '<leader>ac', ng.goto_component_with_template_file, opts)
    map('n', '<leader><tab>', function()
      local buffer = vim.api.nvim_get_current_buf()
      local filetype = vim.api.nvim_buf_get_option(buffer, 'filetype')
      if filetype == 'typescript' or filetype == 'typescriptreact' then
        ng.goto_template_for_component()
      else
        ng.goto_component_with_template_file()
      end
    end, opts)
  end,
}
