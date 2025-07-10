local prettier = require("prettier")
prettier.setup({
  	bin = 'prettier',filetypes = {
    	"css",
    	"html",
    	"javascript",
		"javascriptreact",
    	"json",
		"jsonc",
    	"less",
    	"markdown","scss",
    	"typescript",
		"typescriptreact",
  	},
	cli_options = {
    	arrow_parens = "always",
    	bracket_spacing = true,
    	bracket_same_line = false,
		embedded_language_formatting = "auto",
    	end_of_line = "lf",
    	html_whitespace_sensitivity = "css",
    	jsx_single_quote = false,
    	print_width = 200,
    	prose_wrap = "preserve",
    	quote_props = "as-needed",
    	semi = true,
    	single_attribute_per_line = false,
    	single_quote = false,
    	tab_width = 4,
    	use_tabs = true,
		trailing_comma = "none"
	}
})
