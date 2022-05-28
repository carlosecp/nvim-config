-- nvim-tree.lua
-- A file explorer tree for neovim written in lua.
-- https://github.com/kyazdani42/nvim-tree.lua

local nvimtree = require("nvim-tree")
nvimtree.setup {
	disable_netrw = false,
	hijack_netrw  = false,
	diagnostics = {
		enable = false
	},
	git = {
		enable = false,
		ignore = true
	},
	update_focused_file = {
		enable = true,
	}
}
