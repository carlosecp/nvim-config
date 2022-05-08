-- use {
-- 	"navarasu/onedark.nvim",
-- 	config = function()
-- 		require "colorschemes.onedark"
-- 	end
-- }

local onedark = require "onedark"

onedark.setup({
	style = "dark",
	transparent = true,
 	code_style = {
 		comments = "italic"
 	},
	highlights = {
		VertSplit = { fg = "#21252b" },
		ColorColumn = { bg = "#21252b" },
		Pmenu = { bg = "none" },
		NormalFloat = { bg = "none" },
		FloatBorder = {
			fg= "#21252b",
			bg = "none"
		},
		TelescopeBorder = { fg = "#21252b" },
		TelescopePreviewBorder = { fg = "#21252b" },
		TelescopePromptBorder = { fg = "#21252b" },
		TelescopeResultsBorder = { fg = "#21252b" }
	}
})

onedark.load()
