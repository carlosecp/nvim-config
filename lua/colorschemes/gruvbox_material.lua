-- use {
-- 	"sainnhe/gruvbox-material",
-- 	config = function()
-- 		require("colorschemes.gruvbox_material")
-- 	end
-- }

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_statusline_style = "original"
vim.cmd("colo gruvbox-material")

vim.cmd("hi ColorColumn guibg=#3c3836")
vim.cmd("hi CursorLine guibg=#3c3836")
vim.cmd("hi Todo guifg=#dfaa2e gui=bold,underline")
