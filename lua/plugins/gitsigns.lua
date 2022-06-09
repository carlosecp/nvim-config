-- gitsigns.nvim
-- Git integration for buffers
-- https://github.com/lewis6991/gitsigns.nvim

local gitsigns = require("gitsigns")
gitsigns.setup {
	current_line_blame = true,
	on_attach = function()
		vim.wo.signcolumn = "yes"
	end
}
