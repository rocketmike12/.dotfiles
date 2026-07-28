return {
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
	}
}
