-- use {
-- 	"tjdevries/gruvbuddy.nvim",
-- 	config = function()
-- 		require("plugins.colorschemes.gruvbuddy")
-- 	end,
-- 	requires = "tjdevries/colorbuddy.vim"
-- }

require("colorbuddy").colorscheme("gruvbuddy")
vim.cmd("hi Normal guibg=NONE")
vim.cmd("hi VertSplit gui=NONE")
vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")
vim.cmd("hi DiagnosticUnderlineInfo gui=undercurl")
vim.cmd("hi DiagnosticUnderlineHint gui=undercurl")

vim.cmd("hi Constant guifg=NONE")
vim.cmd("hi Function guifg=NONE")
vim.cmd("hi Identifier guifg=NONE")
