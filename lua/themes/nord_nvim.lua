-- use {
-- 	"shaunsingh/nord.nvim",
-- 	config = function()
-- 		require "themes.nord_nvim"
-- 	end
-- }

vim.g.nord_borders = true
vim.cmd("colo nord")
vim.cmd("hi Comment gui=italic")
vim.cmd("hi NvimTreeGitIgnored gui=NONE")
