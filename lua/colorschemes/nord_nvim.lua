-- use {
-- 	"shaunsingh/nord.nvim",
-- 	config = function()
-- 		require "colorschemes.nord_nvim"
-- 	end
-- }

vim.g.nord_borders = true
vim.g.nord_italic = false
vim.g.nord_disable_background = true

vim.cmd("colo nord")
vim.cmd("hi Comment gui=italic")
vim.cmd("hi NvimTreeGitIgnored gui=NONE")
