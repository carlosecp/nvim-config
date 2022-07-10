local status_ok_gitsigns, gitsigns = pcall(require, "gitsigns")

if not status_ok_gitsigns then return end

gitsigns.setup({
	current_line_blame = true,
	on_attach = function()
		vim.wo.signcolumn = "yes"
	end
})
