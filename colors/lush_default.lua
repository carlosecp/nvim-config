-- use {
-- 	"rktjmp/lush.nvim",
-- 	config = function()
-- 		vim.cmd("colo lush_default")
-- 	end
-- }
vim.cmd("set background=dark")

local status_ok, lush = pcall(require, "lush")
if not status_ok then
	return
end

lush(require "themes.lush_default")
vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")
vim.cmd("hi DiagnosticUnderlineInfo gui=undercurl")
vim.cmd("hi DiagnosticUnderlineHint gui=undercurl")
