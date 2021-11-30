-- use {
	-- "navarasu/onedark.nvim",
	-- config = function()
		-- require "themes.onedark"
	-- end
-- }

vim.g.onedark_transparent_background = true
vim.g.onedark_italic_comment = false
require "onedark".setup {}
vim.cmd("hi VertSplit guibg=#21252b")
