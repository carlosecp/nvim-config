vim.cmd("set background=dark")
require "lush"(require "themes.default_mod")
vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")
vim.cmd("hi DiagnosticUnderlineInfo gui=undercurl")
vim.cmd("hi DiagnosticUnderlineHint gui=undercurl")
