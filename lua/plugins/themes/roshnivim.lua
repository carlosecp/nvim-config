-- use {
-- 	"shaeinst/roshnivim-cs",
-- 	config = function()
-- 		require("plugins.themes.roshnivim")
-- 	end
-- }

vim.g.transparent_background = true
vim.cmd("colo rvcs")
vim.cmd("hi ColorColumn guibg=#141414")
vim.cmd("hi clear Error")
vim.cmd("hi clear TSError")
