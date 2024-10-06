local lsp_config = require("configs.lsp")

return {
	{
		"williamboman/mason.nvim",
		opts = lsp_config.mason_config,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				event = { "BufReadPre", "BufNewFile" },
			},
			{ "hrsh7th/cmp-nvim-lsp" }
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup(lsp_config.mason_lspconfig_config(lspconfig, capabilities))
		end
	}
}
