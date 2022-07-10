-- use {
-- 	"shaeinst/roshnivim-cs",
-- 	config = function()
-- 		require("plugins.colorschemes.roshnivim")
-- 	end
-- }

vim.g.transparent_background = true
vim.cmd("colo rvcs")
vim.cmd("hi clear Error")
vim.cmd("hi clear TSError")
vim.cmd("hi ColorColumn guibg=#141414")
vim.cmd("hi TabLine guifg=NONE guibg=NONE gui=NONE")
vim.cmd("hi TabLineFill gui=NONE")
vim.cmd("hi TabLineSel guibg=NONE gui=inverse")
