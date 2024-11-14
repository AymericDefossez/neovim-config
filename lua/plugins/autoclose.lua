local autoclose_config = require("configs.autoclose_configs")

return {
	{
		"m4xshen/autoclose.nvim",
		opts = autoclose_config,
	},
	{
		"alvan/vim-closetag",
    config = function()
      vim.g.closetag_shortcut = '!'
    end,
	}
}
