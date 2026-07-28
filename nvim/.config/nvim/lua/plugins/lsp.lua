vim.opt.completeopt = { "menuone", "noselect", "popup" }

return {
	{
		'mason-org/mason.nvim',
		opts = {},
	},

	{
		'mason-org/mason-lspconfig.nvim',
		opts = {
			ensure_installed = {
				'clangd',
				'lua_ls',
				'pyright',
				'ts_ls',
				'html',
				'cssls',
				'jsonls',
				'rust_analyzer',
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("clangd")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("html")
			vim.lsp.enable("cssls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("rust_analyzer")
		end
	},
}
