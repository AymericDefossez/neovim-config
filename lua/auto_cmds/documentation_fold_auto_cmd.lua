local group_id = vim.api.nvim_create_augroup("foldDocumentation", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
  group = group_id,
  pattern = { "*.ts" },
  callback = function ()
    vim.cmd("setlocal foldmethod=marker")
    vim.cmd("setlocal foldmarker=/**,*/")
  end
})
