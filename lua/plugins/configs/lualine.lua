-- lualine
-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim

local lualine = require("lualine")
lualine.setup {
	options = {
		component_separators = { left = "", rigth = "" },
		section_separators = { left = "", right = ""}
	},
	sections = {
		lualine_a = {{
			"mode",
			color = { fg = "Normal", bg = "NONE", gui = "bold" }
		}},
		lualine_b = {{
			"branch",
			color = "StatusLine",
			icon = ""
		}},
		lualine_c = {
			"%=",
			{
				"filename",
				symbols = {
					modified = " [+]",
					readonly = " [-]",
					unnamed  = "",
				}
			}
		},
		lualine_x = { "filetype" },
		lualine_y = {{ "progress", color = "StatusLine" }},
		lualine_z = {{ "location", color = "StatusLine" }}
	}
}
