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
