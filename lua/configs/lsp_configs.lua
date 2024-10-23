local lsp_servers = {
	"angularls",
	"cssls",
	"html",
	"lua_ls",
	"ts_ls",
}

local mason_config = {
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
}

local function mason_lspconfig_config(lspconfig, capabilities)
	return {
		ensure_installed = lsp_servers,
		automatic_installation = true,
		handlers = {
			function(servername)
				lspconfig[servername].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" }
							},
						},
					},
				})
			end
		}
	}
end

return {
	mason_config = mason_config,
	mason_lspconfig_config = mason_lspconfig_config,
}
