vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascriptreact",
	callback = function()
		vim.treesitter.start(0, "tsx")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.treesitter.start(0, "typescript")
	end,
})
