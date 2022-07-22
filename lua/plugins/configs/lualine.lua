local status_ok_lualine, lualine = pcall(require, "lualine")

if not status_ok_lualine then return end

-- TODO: Fix nvimtree formatting
lualine.setup({
	options = {
		component_separators = {
			left = "",
			rigth = ""
		},
		section_separators = {
			left = "",
			right = ""
		}
	},
	sections = {
		lualine_a = {},
		lualine_b = {{
			"branch",
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
		lualine_y = {{
			"progress"
		}},
		lualine_z = {{
			"location"
		}}
	}
})
