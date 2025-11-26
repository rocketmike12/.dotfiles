local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
vim.lsp.config.lua_ls.setup({
	capabilities = capabilities,
	root_dir = vim.lsp.config.util.root_pattern(".git", "init.lua"),
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

-- JS, TS
vim.lsp.config.ts_ls.setup({})

-- HTML
vim.lsp.config.html.setup({})

-- CSS
vim.lsp.config.cssls.setup({})

-- JSON
vim.lsp.config.jsonls.setup({})

-- Emmet
vim.lsp.config.emmet_ls.setup({
	filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescriptreact" },
})
