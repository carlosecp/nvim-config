local colors = {
	fg = "#88c0d0",
	bg = "#3b4252",
	normal = "#a3be8c",
	visual = "#5e81ac"
}

local vi_modes = {
	["n"]   = "Normal",
	["no"]  = "O-Pending",
	["nov"] = "O-Pending",
	["noV"] = "O-Pending",
	["niI"] = "Normal",
	["niR"] = "Normal",
	["niV"] = "Normal",
	["v"]   = "Visual",
	["V"]   = "V-Line",
	[""]  = "V-Block",
	["s"]   = "Select",
	["S"]   = "S-Line",
	[""]  = "S-Block",
	["i"]   = "Insert",
	["ic"]  = "Insert",
	["ix"]  = "Insert",
	["R"]   = "Replace",
	["Rc"]  = "Replace",
	["Rv"]  = "V-Replace",
	["Rx"]  = "Replace",
	["c"]   = "Command",
	["cv"]  = "Ex",
	["ce"]  = "Ex",
	["r"]   = "Replace",
	["rm"]  = "More",
	["r?"]  = "Confirm",
	["!"]   = "Shell",
	["t"]   = "Terminal"
}

local mode = {
	function()
		local mode_code = vim.api.nvim_get_mode().mode
		return string.format("█ %s ", vi_modes[mode_code])
	end,
	padding = 0,
	color = { fg = colors.normal, bg = colors.bg }
}

local filetype = {
	function()
		local ft = vim.bo.filetype
		if ft == "" then return "" end
		return string.format("[%s]", ft)
	end,
	color = { fg = colors.fg, bg = colors.bg }
}

local scrollbar = {
	function()
		local current_line = vim.fn.line "."
		local total_lines = vim.fn.line "$"
		local chars = { "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end,
	padding = 0,
	color = { fg = colors.normal, bg = colors.bg }
}

require "lualine".setup {
	options = {
		theme = "nord",
		component_separators = {"", ""},
		section_separators   = {"", ""},
		disabled_filetypes = {"packer"}
	},
	sections = {
		lualine_a = { mode },
		lualine_b = {{
			"branch",
			icon = "",
			color = { fg = colors.fg, bg = colors.bg }
		}},
		lualine_c = {{
			"filename",
			path = 0,
			color = { fg = colors.fg, bg = colors.bg }
		}},
		lualine_x = {{
			"diagnostics",
			sources = {"nvim_lsp"},
		}},
		lualine_y = {
			{ "encoding" , color = { fg = colors.fg, bg = colors.bg }},
			filetype
		},
		lualine_z = {scrollbar}
	},
	inactive_sections = {
		lualine_a = {"filename"},
		lualine_b = {},
		lualine_c = {},
	},
	extensions = {"nvim-tree"}
}
