return function()
	local windows = vim.api.nvim_list_wins()
	for _, win in ipairs(windows) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			return true
		end
	end
	return false
end
