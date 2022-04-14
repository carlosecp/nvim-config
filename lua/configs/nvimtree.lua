local nvimtree = require("nvim-tree")
local lib = require("nvim-tree.lib")

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
	view = {
		mappings = {
			list = {
				{
					key = "H",
					action = lib.collapse_all,
					mode = "n"
				}
			}
		}
	},
	update_focused_file = {
		enable = true,
	}
})

