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

vim.keymap.set({'n', 'c', 't'}, '<C-B>', ':NvimTreeToggle<CR>')
vim.keymap.set({'n'}, '<C-D>', 'yyp')

vim.keymap.set({'n', 'c'}, '<C-T>', ':tabnew<CR>')
vim.keymap.set({'n', 'c'}, '<C-PageUp>', ':tabnext<CR>')
vim.keymap.set({'n', 'c'}, '<C-PageDown>', ':tabprevious<CR>')
vim.keymap.set({'n', 'c'}, '<C-W>', ':tabclose,<CR>')

vim.keymap.set({'i', 'n'}, '<C-Enter>', '<C-o>o')

-- vim.keymap.set({'n'}, '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set({'n'}, '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set({'n'}, '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set({'n'}, '<c-l>', ':wincmd l<CR>')
