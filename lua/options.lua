vim.cmd(":set number")
vim.cmd(":set tabstop=2")
vim.cmd(":set shiftwidth=2")
vim.cmd(":set expandtab")
vim.cmd(":set wrap!")
vim.cmd(":set clipboard=unnamedplus")
vim.cmd(":set updatetime=500")

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
autocmd("CursorHold", {
  group = "showDiagnostics",
  pattern = { "*" },
  callback = function ()
    if vim.diagnostic.is_enabled() then
      if not hasfloatingwin() then
        vim.diagnostic.open_float({
          scope = "cursor",
          border = "rounded",
        })
      end
    end
  end
})

-- vim.cmd("set foldmethod=expr")
-- vim.o.foldexpr = function()
--   local match = vim.fn.match
--   local line = vim.fn.getline(vim.v.lnum)
--
--   if match(line, "{$") >= 0 then
--     return "a1"
--   elseif match(line, "}$") >= 0 then
--     return "s1"
--   else
--     return "="
--   end
-- end
