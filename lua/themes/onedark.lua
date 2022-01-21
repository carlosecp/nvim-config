-- use {
-- 	"navarasu/onedark.nvim",
-- 	config = function()
-- 		require "themes.onedark"
-- 	end
-- }

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	return
end

onedark.load()
onedark.setup {
	style = "dark",
	transparent = true,
-- 	code_style = {
-- 		comments = "italic"
-- 	}
}

vim.cmd("hi VertSplit guifg=#21252b")
vim.cmd("hi ColorColumn guibg=#21252b")
