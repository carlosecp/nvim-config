local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvimtree.setup {
	disable_netrw = false,
	hijack_netrw  = false,
	git = { enable = false }
}
