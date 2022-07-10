local status_ok_nvimtree, nvimtree = pcall(require, "nvim-tree")

if not status_ok_nvimtree then return end

nvimtree.setup({
	git = {
		enable = false,
		ignore = false
	},
	update_focused_file = {
		enable = true,
	}
})
