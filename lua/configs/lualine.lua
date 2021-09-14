local custom_sections = {
	scrollbar = {
		function()
			local current_line = vim.fn.line "."
			local total_lines = vim.fn.line "$"
			local chars = { "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		left_padding = 0,
		right_padding = 0,
		color = { fg = "#86ad61", bg = "#1f2335" },
	}
}

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
		lualine_z = {custom_sections.scrollbar}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {{"branch", icon = ""}},
		lualine_c = {{"filename", path = 1}},
		lualine_x = {"encoding", "fileformat", "filetype"},
	}
}
