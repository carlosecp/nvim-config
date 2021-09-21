require "lualine".setup {
	options = {
		component_separators = "",
		section_separators = "",
		theme = "nord"
	},
	sections = {
		lualine_b = {{"branch", icon = ""}},
	}
}
