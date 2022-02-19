local nvimtree = require("nvim-tree")
nvimtree.setup({
	disable_netrw = false,
	hijack_netrw  = false,
	diagnostics = {
		enable = false
	},
	git = {
		enable = false,
		ignore = false
	},
	update_focused_file = {
		enable = true,
	}
})
