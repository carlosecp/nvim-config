-- feline.nvim
-- A minimal, stylish and customizable statusline for Neovim written in Lua.
-- https://github.com/feline-nvim/feline.nvim

local feline = require("feline")

local components = {
	active = {},
	inactive = {}
}

-- Active Components
-- Active Components Left
table.insert(components.active, {
	{
		provider = {
			name = "vi_mode",
			opts = {
				padding = "center"
			}
		},
		hl = function()
			local vi_mode = require("feline.providers.vi_mode")
			return {
				name = vi_mode.get_mode_highlight_name(),
				bg = "NONE",
				style = "bold"
			}                                                                               
		end,
		icon = ""
	},
	{ provider = "git_branch" }
})

-- Active Components Center
table.insert(components.active, {
	{
		provider = {
			name = "file_info",
			opts = {
				type = "relative"
			}
		}
	}
})

-- Active Components Right
table.insert(components.active, {
	{ provider = "position" }
})

feline.setup {
	components = components
}

feline.winbar.setup {
	components = {
		active = {{provider = "file_info" }}
	}
}
