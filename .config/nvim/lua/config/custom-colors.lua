local theme = {}

theme.colors = {
    bg = "#1e1e2e",
    fg = "#cdd6f4",
    accent = "#f38ba8",
    comment = "#6c7086",
    cursorline = "#313244",
    selection = "#45475a",
    keyword = "#cba6f7",
    string = "#a6e3a1",
    function_name = "#fab387",
}

function theme.set_highlights()
    local hl = vim.api.nvim_set_hl
    hl(0, "Normal", { fg = theme.colors.fg, bg = theme.colors.bg })
    hl(0, "Comment", { fg = theme.colors.comment, italic = true })
    hl(0, "CursorLine", { bg = theme.colors.cursorline })
    hl(0, "Visual", { bg = theme.colors.selection })
    hl(0, "Keyword", { fg = theme.colors.keyword, bold = true })
    hl(0, "String", { fg = theme.colors.string })
    hl(0, "Function", { fg = theme.colors.function_name, bold = true })
end

function theme.setup()
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = "my_custom_theme"
    theme.set_highlights()
end

return theme

