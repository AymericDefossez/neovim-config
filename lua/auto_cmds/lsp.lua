local group_id = vim.api.nvim_create_augroup("showSignatureHelp", { clear = true })

vim.api.nvim_create_autocmd("CursorMovedI", {
	group = group_id,
	pattern = { "*" },
	callback = function ()
    vim.lsp.buf.signature_help()
	end
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.buf.signature_help, {
  focus = false,
})
