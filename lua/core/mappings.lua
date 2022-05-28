local utils = require("core.utils")
local map = utils.map

map("n", "<Leader>h",        ":noh<CR>")
map("n", "<Leader><Leader>", "<C-^>")

-- Resizing windows
map("n", "<C-Up>",    ":res +5<CR>")
map("n", "<C-Down>",  ":res -5<CR>")
map("n", "<C-Right>", ":vert res +5<CR>")
map("n", "<C-Left>",  ":vert res -5<CR>")

map("n", "<Leader>cc", function()
	local colorcolumn = vim.wo.colorcolumn
	vim.wo.colorcolumn = string.len(colorcolumn) == 0 and "80" or ""
end)

map("n", "<C-n>", ":cn<CR>")
map("n", "<C-p>", ":cn<CR>")

-- mappings for plugins
local M = {}

function M.easy_align()
	map("x", "ga", "<Plug>(EasyAlign)")
end

function M.lsp()
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

function M.null_ls()
	map("n", "<Leader>x", vim.lsp.buf.formatting, { buffer = true })
end

function M.nvimtree()
	map("n", "<Leader>e", ":NvimTreeToggle<CR>")
end

function M.telescope()
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
