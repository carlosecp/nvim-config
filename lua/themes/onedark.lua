-- use {
	-- "navarasu/onedark.nvim",
	-- config = function()
		-- require "themes.onedark"
	-- end
-- }

vim.g.onedark_transparent_background = true
vim.g.onedark_italic_comment = false
require "onedark".setup {}
vim.cmd("hi VertSplit guifg=#21252b")
vim.cmd("hi ColorColumn guibg=#21252b")
vim.cmd("hi NvimTreeNormal guibg=#21252b")
