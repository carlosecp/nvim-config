-- use {
-- 	"https://github.com/navarasu/onedark.nvim",
-- 	config = function()
-- 		require("plugins.colorschemes.onedark")
-- 	end
-- }

local onedark = require("onedark")

onedark.setup({
	style = "dark",
	transparent = false,
 	code_style = {
 		comments = "italic"
 	},
	highlights = {
		--	VertSplit = { fg = "#21252b" },
		--	ColorColumn = { bg = "#21252b" },
		--	LineNr = { fg = "#333a43" },
		--	Pmenu = { bg = "none" },
		--	NormalFloat = { bg = "none" },
		--	FloatBorder = {
		--		fg= "#21252b",
		--		bg = "none"
		--	},
		--	TelescopeTitle = { fg = "#abb2bf" },
		--	TelescopeBorder = { fg = "#21252b" },
		--	TelescopePreviewBorder = { fg = "#21252b" },
		--	TelescopePromptBorder = { fg = "#21252b" },
		--	TelescopeResultsBorder = { fg = "#21252b" },
		--	CmpBorder = { fg = "#21252b" },
		NvimTreeNormal = { bg = "#21242b" },
		NvimTreeNormalNC = { bg = "#21242b" },
		CursorLine = { bg = "#21242b" },
		StatusLine = { bg = "#21242b" },
		StatusLineNC = { bg = "#21242b" }
	}
})

onedark.load()
