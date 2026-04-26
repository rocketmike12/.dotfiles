vim.api.nvim_create_user_command("Format", function()
	require("conform").format({
		lsp_fallback = true,
		async = true,
		bufnr = 0,
	})
end, {})
vim.cmd('command F Format')
vim.cmd('command JsxSE %s/\\(className\\)="\\([^"]*\\)"/\\1={styles["\\2"]}/g')
