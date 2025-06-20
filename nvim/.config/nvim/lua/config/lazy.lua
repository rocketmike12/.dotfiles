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
	-- require('config.cmp'),

	-- nvim-cmp
  	{
    	'hrsh7th/nvim-cmp',
    	dependencies = {
      		'hrsh7th/cmp-nvim-lsp',
      		'hrsh7th/cmp-buffer',
      		'hrsh7th/cmp-path',
      		'hrsh7th/cmp-cmdline',
      		'L3MON4D3/LuaSnip',
      		'saadparwaiz1/cmp_luasnip',
      		'rafamadriz/friendly-snippets',
    	},

    	config = function()
      		require('config.cmp')
    	end
  	},

	-- lsp stuff
  	{
		'neovim/nvim-lspconfig',
    	config = function()
      		require('config.lsp')
    	end
  	},

	{
  		"williamboman/mason.nvim",
  		build = ":MasonUpdate",
  		config = true
	},

	{
  		"williamboman/mason-lspconfig.nvim",
  		dependencies = { "mason.nvim" },
  		config = function()
    		require("mason").setup()
    		require("mason-lspconfig").setup({
      			ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"jsonls",
					"ts_ls",
					"emmet_ls",
				}
    		})
  		end
	},

	{ 'neovim/nvim-lspconfig' },
	-- { 'jose-elias-alvarez/null-ls.nvim' },
	{ 'nvimtools/none-ls.nvim' },

	-- Prettier
	{ 'MunifTanjim/prettier.nvim' },

	-- Treesitter
	{
	   	"nvim-treesitter/nvim-treesitter",
	   	build = ":TSUpdate",
		priority = 1,

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

	-- Telescope
	{
    	'nvim-telescope/telescope.nvim', tag = '0.1.8',
    	dependencies = { 'nvim-lua/plenary.nvim' }
    },

	{ 'tmsvg/pear-tree', config = function() end },

	-- live-server
	{
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    },



	-- nvim-tree
	{ 'nvim-tree/nvim-web-devicons', opts = {} },
	{ 'nvim-tree/nvim-tree.lua', opts = {} },

	-- Emmet
	{
		'olrtg/nvim-emmet',
		config = function()
    		vim.keymap.set({'n', 'i'}, '<C-E>', require('nvim-emmet').wrap_with_abbreviation)
  		end,
	},

	-- Alpha dashboard
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

	-- Lualine
	{
    	'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' },
	},

	-- yuck language support
	{ 'elkowar/yuck.vim' },

	-- nvim-colorizer
	{ 'norcalli/nvim-colorizer.lua', opts = {} },

	-- neocord
	{ 'IogaMaster/neocord', event = "VeryLazy", opts = {} },

	-- THEMES
	{ 'Mofiqul/dracula.nvim', opts = {} },

	{ 'wilmanbarrios/palenight.nvim' },

	{ "rebelot/kanagawa.nvim", opts = {} },

	{ 'maxmx03/fluoromachine.nvim', opts = {}},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1, opts = {
		color_overrides = {
			all = {
				crust = "#0a000c",
				mantle = "#0a000c",
				base =  "#0a000c"
			}
		},
		-- transparent_background = true
	} },

	{ 'nyoom-engineering/oxocarbon.nvim', config = function () end },

  	{
    	"baliestri/aura-theme",
    	lazy = false,
    	priority = 1000,
    	config = function(plugin)
      		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    	end
  	},

	{ "rose-pine/neovim", name = "rose-pine", opts = {} },

	{ 'loctvl842/monokai-pro.nvim', opts = {} },

	{ "ellisonleao/gruvbox.nvim", opts = {} },

})
