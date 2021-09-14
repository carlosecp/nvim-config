require "lualine".setup {
	options = {
		theme = "tokyonight",
		component_separators = {"", ""},
		section_separators = {"", ""},
		disabled_filetypes = {"NvimTree"}
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {{"branch", icon = ""}},
		lualine_c = {{"filename", path = 1}},
		lualine_x = {"encoding", "fileformat", "filetype"},
		lualine_y = {"progress"},
		lualine_z = {"location"}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {{"branch", icon = ""}},
		lualine_c = {{"filename", path = 1}},
		lualine_x = {"encoding", "fileformat", "filetype"},
	}
}
