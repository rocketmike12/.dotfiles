return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true,
		opts = {}
	},

	{
		"saghen/blink.cmp",

		version = "1.*",

		dependencies = {
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},

		opts = {
			snippets = {
				preset = "luasnip",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			keymap = {
				preset = "none",

				["<Tab>"] = {
					function(cmp)
						local ls = require("luasnip")

						if cmp.is_visible() then
							return cmp.select_next()
						elseif ls.expand_or_jumpable() then
							ls.expand_or_jump()
							return true
						end
					end,
					"fallback",
				},

				["<S-Tab>"] = {
					function(cmp)
						local ls = require("luasnip")

						if cmp.is_visible() then
							return cmp.select_prev()
						elseif ls.jumpable(-1) then
							ls.jump(-1)
							return true
						end
					end,
					"fallback",
				},

				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				menu = {
					border = "rounded",

					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
						},
					},
				},

				documentation = {
					auto_show = false,
					window = {
						border = "rounded",
					},
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},

		opts_extend = { "sources.default" },
	}
}
