local status_ok, comment_nvim = pcall(require, "Comment")
if not status_ok then
	return
end

comment_nvim.setup {
	toggler = {
		line  = "gcc",
		block = "gbc"
	},
	opleader = {
		line  = "gc",
		block = "gb"
	}
}
