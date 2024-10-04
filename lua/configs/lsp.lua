local mason_config = {
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
}

local lsp_servers = {
	"angularls",
	"cssls",
	"html",
	"lua_ls",
	"ts_ls",
}

return {
	mason_config = mason_config,
	lsp_servers = lsp_servers,
}
