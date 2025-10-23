local get_config = function(luasnip, cmp)
	return {
		completion = {
			completopt = "menu,menuone,preview,noselect"
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Esc>"] = cmp.mapping.abort(),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		})
	}
end

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
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup(get_config(luasnip, cmp))
	end
}
