local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

dashboard.section.buttons.val = {
	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = {
	'"UNIX is simple and coherent" - Dennis Ritchie',
	'"GNU\'s not UNIX"              - Richard Stallman',
}

local total_lines = #dashboard.section.header.val + #dashboard.section.buttons.val + #dashboard.section.footer.val
local win_height = vim.fn.winheight(0)
local top_padding = math.floor((win_height - total_lines) / 2 - 6)
table.insert(dashboard.config.layout, 1, { type = "padding", val = top_padding })

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
