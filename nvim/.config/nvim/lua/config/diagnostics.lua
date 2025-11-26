vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

vim.cmd([[
	hi NormalFloat guibg=#0a000c
	hi FloatBorder guibg=#0a000c
]])

vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			border = "rounded",
			source = "always",
			header = "",
		})
	end,
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticHint" })

vim.cmd([[
	hi DiagnosticError guifg=#ff4d6d guibg=NONE
	hi DiagnosticWarn guifg=#ffa500 guibg=NONE
	hi DiagnosticInfo guifg=#00ffff guibg=NONE
	hi DiagnosticHint guifg=#ff00ff guibg=NONE
]])
