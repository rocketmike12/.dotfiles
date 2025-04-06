vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1

require('config.keymaps')
require('config.lazy')

require('config.colorscheme')

require('lualine').setup({
	options = { theme = 'palenight' }
})

local function set_kitty_padding(padding)
	local window_id = os.getenv("KITTY_WINDOW_ID")
  	if window_id then
    	local cmd = string.format("kitty @ set-spacing --window-id=%s padding=%d", window_id, padding)
    	os.execute(cmd)
  	end
end

vim.api.nvim_create_autocmd("VimEnter", {
  	callback = function()
    	set_kitty_padding(0)
  	end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  	callback = function()
    	set_kitty_padding(5)  -- Replace 20 with your actual kitty padding
  	end,
})

