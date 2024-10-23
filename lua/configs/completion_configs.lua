return function(luasnip, cmp)
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
