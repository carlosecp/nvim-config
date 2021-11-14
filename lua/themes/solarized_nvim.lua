-- use {
-- 	"ishan9299/nvim-solarized-lua",
-- 	config = function()
-- 		require "themes.solarized_nvim"
-- 	end
-- }

vim.g.solarized_italics = 0
vim.cmd("colo solarized")
vim.cmd("hi Normal guibg=NONE")
vim.cmd("hi TSVariable guibg=NONE")
