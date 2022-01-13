-- use {
-- 	"ishan9299/nvim-solarized-lua",
-- 	config = function()
-- 		require "themes.nvim_solarized_lua"
-- 	end
-- }

vim.g.solarized_italics = 0
vim.g.solarized_termtrans = 1
vim.cmd("colo solarized")
vim.cmd("hi TSVariable guibg=NONE")
vim.cmd("hi ColorColumn guibg=#002b36")
