return {
  on_create = function()
    vim.cmd('TermExec cmd="source ~/.profile"')
    vim.cmd('TermExec cmd="clear"')
  end,
}
