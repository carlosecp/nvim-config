-- use {
-- 	"tjdevries/gruvbuddy.nvim",
-- 	config = function()
-- 		require("carlosecp.colorschemes.gruvbuddy")
-- 	end,
-- 	requires = "tjdevries/colorbuddy.vim"
-- }

require("colorbuddy").colorscheme("gruvbuddy")
vim.cmd("hi Normal guibg=NONE")

vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")
vim.cmd("hi DiagnosticUnderlineInfo gui=undercurl")
vim.cmd("hi DiagnosticUnderlineHint gui=undercurl")
