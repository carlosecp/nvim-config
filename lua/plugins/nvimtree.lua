-- nvim-tree.lua
-- A file explorer tree for neovim written in lua.
-- https://github.com/kyazdani42/nvim-tree.lua

local nvimtree = require("nvim-tree")
nvimtree.setup {
	git = {
		enable = false,
		ignore = false
	},
	update_focused_file = {
		enable = true,
	}
}
