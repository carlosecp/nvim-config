local map    = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts   = { silent = true, noremap = true }

vim.g.mapleader = " "

map("n", "<Leader>h",        ":noh<CR>",            opts)
map("n", "<Leader><Leader>", "<C-^>",               opts)
map("n", "<C-J>",            "<C-W><C-J>",          { noremap = true })
map("n", "<C-K>",            "<C-W><C-K>",          { noremap = true })
map("n", "<C-L>",            "<C-W><C-L>",          { noremap = true })
map("n", "<C-H>",            "<C-W><C-H>",          { noremap = true })
map("n", "<C-Up>",           ":resize +5<CR>",      opts)
map("n", "<C-Down>",         ":resize -5<CR>",      opts)
map("n", "<C-Right>",        ":vert resize +5<CR>", opts)
map("n", "<C-Left>",         ":vert resize -5<CR>", opts)
map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })
map("n", "<Leader>cc", ":execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '')<CR>", opts)

--[[ Bindings that are gonna be required only when for specific plugins. These
are not activated if their respective plugins are not active. ]]
local M = {}

M.nvim_tree = function()
	map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
end

M.lsp = function(bufnr)
	bufmap(bufnr, "n", "K",          ":lua vim.lsp.buf.hover()<CR>",          opts)
	bufmap(bufnr, "n", "gs",         ":lua vim.lsp.buf.signature_help()<CR>", opts)
	bufmap(bufnr, "n", "gd",         ":lua vim.lsp.buf.definition()<CR>",     opts)
	bufmap(bufnr, "n", "gD",         ":lua vim.lsp.buf.declaration()<CR>",    opts)
	bufmap(bufnr, "n", "gi",         ":lua vim.lsp.buf.implementation()<CR>", opts)
	bufmap(bufnr, "n", "gr",         ":lua vim.lsp.buf.references()<CR>",     opts)
	bufmap(bufnr, "n", "gx",         ":lua vim.lsp.buf.signature_help()<CR>", opts)
	bufmap(bufnr, "n", "<Leader>rn", ":lua vim.lsp.buf.rename()<CR>",         opts)
	bufmap(bufnr, "n", "<Leader>ca", ":lua vim.lsp.buf.code_action()<CR>",    opts)
	bufmap(bufnr, "n", "<C-s>",      ":lua vim.lsp.buf.formatting()<CR>",     opts)

	bufmap(bufnr, "n", "[g", ":lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
	bufmap(bufnr, "n", "]g", ":lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
end

M.toggle_terminal = function()
	map("n", "<C-t>", ":lua require 'core.terminal'.term_toggle()<CR>", opts)
  vim.cmd("tnoremap <Esc> <C-\\><C-n>")
end

M.telescope = function()
	map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", opts)
	map("n", "<Leader>lg", ":Telescope live_grep<CR>",              opts)

	-- Custom finders
	map("n", "<Leader>nv", ":lua require 'configs.telescope'.search_neovim()<CR>",   opts)
	map("n", "<Leader>df", ":lua require 'configs.telescope'.search_dotfiles()<CR>", opts)
end

M.easyAlign = function()
	map("x", "ga", "<Plug>(EasyAlign)", {})
end

return M
