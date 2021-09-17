local github_theme = {
	dark = {
		normal = {
			a = { bg = "#1f6feb" },
			b = {},
			c = {}
		},
		insert = {
			a = { bg = "#1f6feb" },
			b = {},
			c = {}
		},
		visual = {
			a = {},
			b = {},
			c = {}
		},
		replace = {
			a = {},
			b = {},
			c = {}
		},
		command = {
			a = {},
			b = {},
			c = {}
		},
		inactive = {
			a = { fg = "#2f353c" },
			b = { fg = "#2f353c" },
			c = { fg = "#2f353c" }
		}
	}
}

require "lualine".setup {
	options = {
		theme = github_theme.dark,
		component_separators = {"", ""},
		section_separators = {"", ""},
		disabled_filetypes = {"NvimTree"}
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {{"branch", icon = ""}},
		lualine_c = {"'%='", {"filename", path = 1}},
		lualine_x = {"filetype"},
		lualine_y = {"progress"},
		lualine_z = {"location"}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {{"branch", icon = ""}},
		lualine_c = {"'%='", {"filename", path = 1}},
		lualine_x = {},
		lualine_y = {"progress"},
		lualine_z = {"location"}
	}
}
