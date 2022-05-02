local map = vim.keymap.set
local noremap = { noremap = true }
local silent = { silent = true }
local buffer = { buffer = true }

local no_si = vim.tbl_deep_extend("force", noremap, silent)
local no_si_buf = vim.tbl_deep_extend("force", noremap, silent, buffer)

vim.g.mapleader = " "

map("n", "<Leader>h",        ":noh<CR>",         noremap)
map("n", "<Leader><Leader>", "<C-^>",            no_si)
map("n", "<C-Up>",           ":res +5<CR>",      no_si)
map("n", "<C-Down>",         ":res -5<CR>",      no_si)
map("n", "<C-Right>",        ":vert res +5<CR>", no_si)
map("n", "<C-Left>",         ":vert res -5<CR>", no_si)

map("n", "<Leader>cc", function()
	local colorcolumn = vim.wo.colorcolumn
	vim.wo.colorcolumn = string.len(colorcolumn) == 0 and "80" or ""
end, noremap)

local M = {}

M.easy_align = function()
	map("x", "ga", "<Plug>(EasyAlign)", noremap)
end

M.lsp = function()
	map("n", "K",          vim.lsp.buf.hover,          no_si_buf)
	map("n", "gs",         vim.lsp.buf.signature_help, no_si_buf)
	map("n", "gd",         vim.lsp.buf.definition,     no_si_buf)
	map("n", "gD",         vim.lsp.buf.declaration,    no_si_buf)
	map("n", "gx",         vim.lsp.buf.signature_help, no_si_buf)
	map("n", "<Leader>rn", vim.lsp.buf.rename,         no_si_buf)
	map("n", "<Leader>ca", vim.lsp.buf.code_action,    no_si_buf)
	map("n", "[g",         vim.diagnostic.goto_next,   no_si_buf)
	map("n", "]g",         vim.diagnostic.goto_prev,   no_si_buf)
end

M.null_ls = function()
	map("n", "<Leader>x", vim.lsp.buf.formatting, no_si_buf)
end

M.nvimtree = function()
	map("n", "<Leader>e", ":NvimTreeToggle<CR>", noremap)
end

M.telescope = function()
	map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", noremap)
	map("n", "<Leader>gf", function()
		require "configs.telescope".project_files()
	end, noremap)

	map("n", "<Leader>lg", ":Telescope live_grep<CR>", noremap)

	-- Custom telescope finders.
	map("n", "<Leader>df", function()
		require "configs.telescope".search_dotfiles()
	end, noremap)
	map("n", "<Leader>nv", function()
		require "configs.telescope".search_neovim()
	end, noremap)
end

return M
