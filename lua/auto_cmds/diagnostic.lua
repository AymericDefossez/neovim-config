local has_floating_win = require("utils.has_floating_win")
local group_id = vim.api.nvim_create_augroup("showDiagnostics", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
	group = group_id,
	pattern = { "*" },
	callback = function ()
		if vim.diagnostic.is_enabled() then
			if not has_floating_win() then
				vim.diagnostic.open_float({
          border = "rounded",
        })
			end
		end
	end
})
