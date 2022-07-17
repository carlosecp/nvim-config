--[[ use({
	"shaunsingh/nord.nvim",
	config = function()
		require("plugins.colorschemes.nord")
	end
}) ]]

vim.g.nord_borders = true
vim.g.nord_italic = false
-- vim.g.nord_disable_background = true

vim.cmd("colo nord")
vim.cmd("hi Comment gui=italic")
-- vim.cmd("hi NvimTreeGitIgnored gui=NONE")
-- vim.cmd("hi EndOfBuffer guifg=#616E88")
vim.cmd("hi NvimTreeIndentMarker guifg=#616E88")
vim.cmd("hi NvimTreeEmptyFolderName guifg=#616E88")

-- vim.cmd("hi Todo gui=reverse")
