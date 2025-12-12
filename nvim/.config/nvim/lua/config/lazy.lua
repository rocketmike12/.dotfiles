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

	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},

		lazy = false,

		config = function()
			require("config.cmp")
		end,
	},

	-- lsp stuff
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("config.lsp")
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		lazy = false,
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		lazy = false,
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"jsonls",
					"ts_ls",
					"clangd",
				},
			})
		end,
	},

	-- { 'jose-elias-alvarez/null-ls.nvim' },
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("config.none_ls")
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("config.diagnostics")
			require("trouble").setup({
				use_lsp_diagnostic_signs = true,
				icons = true,
				use_diagnostic_signs = true,
				auto_open = false,
				auto_close = true,
				fold_open = "",
				fold_closed = "",
				signs = {
					error = "",
					warning = "",
					hint = "",
					information = "",
				},
				indent_lines = true,
				mode = "document_diagnostics",
			})
		end,
	},

	-- Prettier
	{ "MunifTanjim/prettier.nvim" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		priority = 1,

		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				additional_vim_regex_highlighting = false,
			})
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "tmsvg/pear-tree", config = function() end },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	-- nvim-tree
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{ "nvim-tree/nvim-tree.lua", opts = {} },

	-- Emmet
	{
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "i" }, "<C-E>", require("nvim-emmet").wrap_with_abbreviation)
		end,
	},

	-- Alpha dashboard
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			-- available: devicons, mini, default is mini
			-- if provider not loaded and enabled is true, it will try to use another provider
			startify.file_icons.provider = "devicons"
			require("alpha").setup(startify.config)
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- live-server
	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},

	-- yuck language support
	{
		"elkowar/yuck.vim",
		event = "VeryLazy",
	},

	-- nvim-colorizer
	{ "norcalli/nvim-colorizer.lua", opts = {} },

	-- neocord
	{ "IogaMaster/neocord", event = "VeryLazy", opts = {} },

	-- { 'edluffy/hologram.nvim', opts={} },

	-- { 'glacambre/firenvim', build = ":call firenvim#install(0)" },

	{
		"kylechui/nvim-surround",
		-- version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- THEMES
	{ "Mofiqul/dracula.nvim", opts = {} },

	{ "wilmanbarrios/palenight.nvim" },

	{ "rebelot/kanagawa.nvim", opts = {} },

	{ "maxmx03/fluoromachine.nvim", opts = {} },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1,

		integrations = {
			cmp = true,
		},

		opts = {
			color_overrides = {
				all = {
					crust = "#0a000c",
					mantle = "#0a000c",
					base = "#0a000c",
				},
			},
			transparent_background = true,
		},
	},

	{ "nyoom-engineering/oxocarbon.nvim", config = function() end },

	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
		end,
	},

	{ "rose-pine/neovim", name = "rose-pine", opts = {} },

	{ "loctvl842/monokai-pro.nvim", opts = {} },

	{ "ellisonleao/gruvbox.nvim", opts = {} },

	{
		"xero/evangelion.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({})
		end,
	},
})
