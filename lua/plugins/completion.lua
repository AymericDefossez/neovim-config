return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
      dependencies = {
		    "rafamadriz/friendly-snippets",
      },
    },
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local completion_config = require("configs.completion_configs")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup(completion_config(luasnip, cmp))
	end
}
