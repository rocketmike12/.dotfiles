require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		python = { 'isort', 'black' },
		rust = { 'rustfmt', lsp_format = 'fallback' },
		javascript = { 'prettierd', 'prettier', stop_after_first = true },
	},
})

vim.api.nvim_create_user_command(
	'Format',
	function(args)
		require('conform').format({ bufnr = args.buf })
	end,
	{ nargs = '?' }
)
