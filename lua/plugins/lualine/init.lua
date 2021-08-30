local default_colors = {
	a = { bg = "#2188ff", fg = "#1f2428", gui = "bold" },
	b = { bg = "#1f2428", fg = "#e2e5e9", gui = "bold" },
	c = { bg = "#1f2428", fg = "#e2e5e9", gui = "bold" },
}

local github = {
	normal = default_colors,
	insert = default_colors,
	visual = default_colors,
	replace = default_colors,
	command = default_colors,
	inactive = {
		a = { bg = "#1f2428", fg = "#6c7a89", gui = "bold" },
	}
}

require "lualine".setup {
	options = {
		theme = github,
		section_separators = {"", ""},
		component_separators = {"", ""},
		icons_enabled = 1
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {{
			"branch",
			icon = "",
		}},
		lualine_c = {{
			"filename",
			path = 1
		}},
		lualine_x = {"filetype"},
		lualine_y = {"location"},
		lualine_z = {"progress"}
	},
	inactive_sections = {
		lualine_a = {{
			"filename",
			path = 1
		}},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	}
}

