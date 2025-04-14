vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1

require('config.keymaps')
require('config.lazy')

require('config.colorscheme')

require('lualine').setup({
	options = { theme = 'palenight' }
})

