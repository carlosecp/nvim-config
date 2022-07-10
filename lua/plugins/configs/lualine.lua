local status_ok_lualine, lualine = pcall(require, "lualine")

if not status_ok_lualine then return end

lualine.setup({
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
			icon = ""
		}},
		lualine_c = {
			"%=",
			{
				"filename",
				path = 1,
				symbols = {
					modified = "",
					readonly = "",
					unnamed  = "",
				}
			}
		},
		lualine_x = {},
		lualine_y = {{ "progress", color = "StatusLine" }},
		lualine_z = {{ "location", color = "StatusLine" }}
	}
})
