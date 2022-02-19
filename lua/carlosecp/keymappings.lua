local map = vim.keymap.set
local noremap = { noremap = true }
local silent_noremap = { silent = true, noremap = true }

vim.g.mapleader = " "

map("n", "<Leader>h",        ":noh<CR>",         noremap)
map("n", "<Leader><Leader>", "<C-^>",            silent_noremap)
map("n", "<C-J>",            "<C-W><C-J>",       silent_noremap)
map("n", "<C-K>",            "<C-W><C-K>",       silent_noremap)
map("n", "<C-L>",            "<C-W><C-L>",       silent_noremap)
map("n", "<C-H>",            "<C-W><C-H>",       silent_noremap)
map("n", "<C-Up>",           ":res +5<CR>",      silent_noremap)
map("n", "<C-Down>",         ":res -5<CR>",      silent_noremap)
map("n", "<C-Right>",        ":vert res +5<CR>", silent_noremap)
map("n", "<C-Left>",         ":vert res -5<CR>", silent_noremap)

map("n", "<Leader>cc", function()
	local colorcolumn = vim.wo.colorcolumn
	vim.wo.colorcolumn = string.len(colorcolumn) == 0 and "80" or ""
end, noremap)

-- Plugin specific bindings
-- These bindings are used to lazy-load some plugins.
local M = {}

M.easy_align_keymappings = function()
	map("x", "ga", "<Plug>(EasyAlign)", noremap)
end

M.lsp_keymappings = function()
	map("n", "K",          vim.lsp.buf.hover,          noremap)
	map("n", "gs",         vim.lsp.buf.signature_help, noremap)
	map("n", "gd",         vim.lsp.buf.definition,     noremap)
	map("n", "gD",         vim.lsp.buf.declaration,    noremap)
	map("n", "gx",         vim.lsp.buf.signature_help, noremap)
	map("n", "<Leader>rn", vim.lsp.buf.rename,         noremap)
	map("n", "<Leader>ca", vim.lsp.buf.code_action,    noremap)
	map("n", "[g",         vim.diagnostic.goto_next,   noremap)
	map("n", "]g",         vim.diagnostic.goto_prev,   noremap)
end

M.null_ls_keymappings = function()
	map("n", "<Leader>x", vim.lsp.buf.formatting, noremap)
end

M.nvimtree_keymappings = function()
	vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", noremap)
end

M.telescope_keymappings = function()
	map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true })
	map("n", "<Leader>lg", ":Telescope live_grep<CR>", { noremap = true })

	-- Custom telescope finders.
	map("n", "<Leader>df", function()
		require("carlosecp.telescope").search_dotfiles()
	end, { noremap = true })
	map("n", "<Leader>nv", function()
		require("carlosecp.telescope").search_neovim()
	end, { noremap = true })
end

return M
