--[[ use({
	"Mofiqul/vscode.nvim",
	config = function()
		require("plugins.colorschemes.vscode_nvim")
	end
}) ]]

vim.g.vscode_style = "dark"
-- vim.g.vscode_transparent = 1

vim.cmd("colo vscode")
vim.cmd("hi ColorColumn guibg=#444444")
