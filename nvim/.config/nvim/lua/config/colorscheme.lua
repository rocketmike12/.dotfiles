-- require("palenight").set()

-- vim.cmd[[colorscheme dracula]]

-- vim.cmd[[colorscheme kanagawa]]

-- vim.cmd.colorscheme "fluoromachine"

-- local content = vim.fn.readfile("/home/mike/.hypr_theme")
-- local output = vim.trim(table.concat(content, "\n"))
--
-- if output == "night" then
-- 	require("catppuccin").setup({
-- 		transparent_background = true
-- 	})
-- end

vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#cba6f7", bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#cba6f7", bg = "NONE" })

-- vim.opt.background = "dark"
-- vim.cmd.colorscheme "oxocarbon"

-- vim.cmd([[colorscheme aura-dark]])

-- vim.cmd([[colorscheme rose-pine]])

-- vim.cmd([[colorscheme monokai-pro]])

-- vim.cmd([[colorscheme gruvbox]])

-- vim.cmd.colorscheme("evangelion")

-- vim.cmd([[colorscheme poimandres]])
