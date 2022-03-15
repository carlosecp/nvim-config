-- use {
-- 	"navarasu/onedark.nvim",
-- 	config = function()
-- 		require("carlosecp.colorschemes.onedark")
-- 	end
-- }

local onedark = require("onedark")

onedark.setup({
	style = "warmer",
	transparent = true,
	-- 	code_style = {
	-- 		comments = "italic"
	-- 	}
})

onedark.load()

vim.cmd("hi VertSplit guifg=#21252b")
vim.cmd("hi ColorColumn guibg=#21252b")
