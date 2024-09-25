vim.cmd(":set number")
vim.cmd(":set tabstop=2")
vim.cmd(":set shiftwidth=2")
vim.cmd(":set expandtab")
vim.cmd(":set wrap!")
vim.cmd(":set clipboard=unnamedplus")

vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}

local hasfloatingwin = require("utils.hasfloatingwin")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("showDiagnostics", { clear = true })
autocmd("CursorMoved", {
  group = "showDiagnostics",
  pattern = { "*" },
  callback = function ()
    if vim.diagnostic.is_enabled() then
      if not hasfloatingwin() then
        vim.diagnostic.open_float()
      end
    end
  end
})
