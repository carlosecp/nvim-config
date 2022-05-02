-- use {
-- 	"ishan9299/nvim-solarized-lua",
-- 	config = function()
-- 		require "colorschemes.nvim_solarized_lua"
-- 	end
-- }

vim.g.solarized_italics = 0
vim.g.solarized_termtrans = 1
vim.cmd("colo solarized-flat")
-- vim.cmd("hi ColorColumn guibg=#002b36")
vim.cmd("hi Todo guifg=#eee8d5 gui=bold")

vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")
vim.cmd("hi DiagnosticUnderlineInfo gui=undercurl")
vim.cmd("hi DiagnosticUnderlineHint gui=undercurl")

-- vim.cmd("hi TSVariable gui=bold guifg=#eee8d5")
vim.cmd("hi TSVariable gui=bold")
vim.cmd("hi TSKeywordFunction gui=bold")
vim.cmd("hi TSConstructor gui=bold")
