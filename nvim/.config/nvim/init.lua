vim.opt.termguicolors = true

function leave_snippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])

vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1

require('config.keymaps')
require('config.lazy')

require('config.aliases')

-- require('config.null_ls')
require('config.prettier')

require('config.colorscheme')

require('lualine').setup({
	options = {
		theme = "catppuccin"
	}
})

require('config.alpha')
