vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy"
    },
    paste = {
        ["+"] = "wl-paste --no-newline",
        ["*"] = "wl-paste --no-newline"
    },
    cache_enabled = 0
}

vim.keymap.set({'n', 'c'}, '<C-B>', ':NvimTreeToggle<CR>')
vim.keymap.set({'n'}, '<C-D>', 'yyp')
vim.keymap.set({'n', 'i', 'v', 'c'}, '<C-T>', ':tabnew<CR>')
vim.keymap.set({'n', 'i', 'v', 'c'}, '<C-Tab>', ':tabnext<CR>')
