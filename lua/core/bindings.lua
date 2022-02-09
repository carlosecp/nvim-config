local noremap = { noremap = true }
local silent_noremap = { silent = true, noremap = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>h",        ":noh<CR>", noremap)
vim.keymap.set("n", "<Leader><Leader>", "<C-^>",    silent_noremap)

-- Window navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", silent_noremap)
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", silent_noremap)
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", silent_noremap)
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", silent_noremap)

-- Window resizing
vim.keymap.set("n", "<C-Up>",    ":res +5<CR>",      silent_noremap)
vim.keymap.set("n", "<C-Down>",  ":res -5<CR>",      silent_noremap)
vim.keymap.set("n", "<C-Right>", ":vert res +5<CR>", silent_noremap)
vim.keymap.set("n", "<C-Left>",  ":vert res -5<CR>", silent_noremap)

-- Better undo history
vim.keymap.set("i", ",", ",<c-g>u", silent_noremap)
vim.keymap.set("i", ".", ".<c-g>u", silent_noremap)
vim.keymap.set("i", "!", "!<c-g>u", silent_noremap)
vim.keymap.set("i", "?", "?<c-g>u", silent_noremap)

-- Toggle colorcolumn on and off
vim.keymap.set("n", "<Leader>cc", function()
	local colorcolumn = vim.api.nvim_win_get_option(0, "colorcolumn")
	vim.opt.colorcolumn = string.len(colorcolumn) == 0 and "80" or ""
end, noremap)

-- Plugin specific bindings
-- These bindings are used to lazy-load some plugins.
local M = {}

M.easy_align = function()
	vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", noremap)
end

M.null_ls = function(bufnr)
	vim.keymap.set("n", "<Leader>x", vim.lsp.buf.formatting, opts)
end

M.nvimtree = function()
	vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", noremap)
end

M.telescope = function()
	vim.keymap.set("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true })
	vim.keymap.set("n", "<Leader>lg", ":Telescope live_grep<CR>", { noremap = true })
end

return M
