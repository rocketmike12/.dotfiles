-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
    	vim.api.nvim_echo({
      		{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      		{ out, "WarningMsg" },
      		{ "\nPress any key to exit..." },
    	}, true, {})
    	vim.fn.getchar()
    	os.exit(1)
  	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	-- Plugins
	
	-- require('config.mason'),
	-- require('config.lspconfig'),
	require('config.cmp'),
	
	-- Treesitter
	{
	   	"nvim-treesitter/nvim-treesitter",
	   	build = ":TSUpdate",
		priority = 1,
		lazy = false,
	   	config = function () 
	     		local configs = require("nvim-treesitter.configs")

	     		configs.setup({
	         		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
	         		sync_install = false,
	         		highlight = { enable = true },
				indent = { enable = true },
				additional_vim_regex_highlighting = false,
	       	})
	   	end
	},

	-- Dracula theme
	{ 'Mofiqul/dracula.nvim' },

	-- nvim-tree
	{ 'nvim-tree/nvim-web-devicons', opts = {} },
	{ 'nvim-tree/nvim-tree.lua', opts = {} },
	
	-- Lualine
	{
    	'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' },	
	},

	{
		'olrtg/nvim-emmet',
		config = function()
    		vim.keymap.set({'n', 'i'}, '<C-E>', require('nvim-emmet').wrap_with_abbreviation)
  		end,
	},

	{ 'wilmanbarrios/palenight.nvim' },
	
	{
    	"goolord/alpha-nvim",
    	-- dependencies = { 'echasnovski/mini.icons' },
    	dependencies = { 'nvim-tree/nvim-web-devicons' },
    	config = function()
      		local startify = require("alpha.themes.startify")
      		-- available: devicons, mini, default is mini
      		-- if provider not loaded and enabled is true, it will try to use another provider
      		startify.file_icons.provider = "devicons"
      		require("alpha").setup(
        		startify.config
      		)
    	end,
  	},

	{ 'tmsvg/pear-tree', config = function() end },

	{ "rebelot/kanagawa.nvim", opts = {} },
	
	{ 'maxmx03/fluoromachine.nvim', opts = {}},
	
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{ 'nyoom-engineering/oxocarbon.nvim', config = function () end },

  	{
    	"baliestri/aura-theme",
    	lazy = false,
    	priority = 1000,
    	config = function(plugin)
      		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    	end
  	},

	{ "rose-pine/neovim", name = "rose-pine" },
})
