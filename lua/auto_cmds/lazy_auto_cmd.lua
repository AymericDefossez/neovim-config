local group_id = vim.api.nvim_create_augroup("updatePlugins", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
	group = group_id,
	callback = function ()
    require("lazy").update({ show = false })
	end,
})
