local utils = require("utils")
local map = utils.map

map("n", "<Leader>h",        ":noh<CR>")
map("n", "<Leader><Leader>", "<C-^>")

-- Switching windows
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-h>", "<C-w>h")

-- Resizing windows
-- map("n", "<C-k>", ":res +2<CR>")
-- map("n", "<C-j>", ":res -2<CR>")
-- map("n", "<C-l>", ":vert res +2<CR>")
-- map("n", "<C-h>", ":vert res -2<CR>")

map("n", "<Leader>cc", function()
	local colorcolumn = vim.wo.colorcolumn
	vim.wo.colorcolumn = string.len(colorcolumn) == 0 and "80" or ""
end)

map("n", "<C-n>", ":cn<CR>")
map("n", "<C-p>", ":cp<CR>")

-- Mappings for plugins
local M = {}

M.easy_align = function()
	map("x", "ga", "<Plug>(EasyAlign)")
end

M.lsp = function()
	map("n", "K",          vim.lsp.buf.hover)
	map("n", "gs",         vim.lsp.buf.signature_help)
	map("n", "gd",         vim.lsp.buf.definition)
	map("n", "gD",         vim.lsp.buf.declaration)
	map("n", "gx",         vim.lsp.buf.signature_help)
	map("n", "<Leader>rn", vim.lsp.buf.rename)
	map("n", "<Leader>ca", vim.lsp.buf.code_action)
	map("n", "[g",         vim.diagnostic.goto_next)
	map("n", "]g",         vim.diagnostic.goto_prev)
end

M.null_ls = function()
	map("n", "<Leader>x", vim.lsp.buf.formatting, { buffer = true })
end

M.nvimtree = function()
	map("n", "<Leader>e", ":NvimTreeToggle<CR>")
end

M.telescope = function()
	map("n", "<Leader>ff", function()
		require("telescope.builtin").find_files { hidden = true }
	end)

	map("n", "<Leader>lg", function()
		require("telescope.builtin").live_grep { hidden = true }
	end)

	map("n", "<Leader>df", function()
		require("telescope.builtin").find_files {
			prompt_title = "Search Dotfiles",
			cwd = "$HOME/.dotfiles",
			hidden = true
		}
	end)

	map("n", "<Leader>nv", function()
		require("telescope.builtin").find_files {
			prompt_title = "Search Nvim Config",
			cwd = "$HOME/.config/nvim",
			hidden = true
		}
	end)
end

return M
