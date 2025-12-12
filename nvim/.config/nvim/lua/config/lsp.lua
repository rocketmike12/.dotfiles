local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function setup_server(name, opts)
	vim.lsp.config[name] = vim.tbl_deep_extend("force", {
		capabilities = capabilities,
	}, opts or {})
	vim.lsp.start(vim.lsp.config[name])
end

-- Lua
setup_server("lua_ls", {
	cmd = { "lua-language-server" },
	root_dir = vim.fs.root(0, { ".git", "init.lua" }),
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

-- TS/JS
setup_server("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
})

-- HTML
setup_server("html", {
	cmd = { "vscode-html-language-server", "--stdio" },
})

-- CSS
setup_server("cssls", {
	cmd = { "vscode-css-language-server", "--stdio" },
})

-- JSON
setup_server("jsonls", {
	cmd = { "vscode-json-language-server", "--stdio" },
})

-- Emmet
setup_server("emmet_language_server", {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescriptreact" },
})

-- C++
setup_server("clangd", {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
})
