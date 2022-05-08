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
		FloatBorder = { fg= "#21252b" }
	}
})

onedark.load()

