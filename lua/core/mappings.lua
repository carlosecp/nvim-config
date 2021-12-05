local map    = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts   = { silent = true, noremap = true }

vim.g.mapleader = " "

map("n", "<Leader>h",        ":noh<CR>",            opts)
map("n", "<Leader><Leader>", "<C-^>",               opts)
map("n", "<Leader>e",        ":NvimTreeToggle<CR>", opts)
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

local mappings = {}

mappings.lsp = function(bufnr)
	bufmap(bufnr, "n", "K",          ":lua vim.lsp.buf.hover()<CR>",                   opts)
	bufmap(bufnr, "n", "gs",         ":lua vim.lsp.buf.signature_help()<CR>",          opts)
	bufmap(bufnr, "n", "gd",         ":lua vim.lsp.buf.definition()<CR>",              opts)
	bufmap(bufnr, "n", "gD",         ":lua vim.lsp.buf.declaration()<CR>",             opts)
	bufmap(bufnr, "n", "<Leader>rn", ":lua vim.lsp.buf.rename()<CR>",                  opts)
	-- bufmap(bufnr, "n", "gc",         ":lua vim.lsp.buf.code_action()<CR>",             opts)
	bufmap(bufnr, "n", "<C-s>",      ":lua vim.lsp.buf.formatting_sync() vim.cmd('w')<CR>", opts)

	-- bufmap(bufnr, "n", "[g", ":lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = 'rounded' }})<CR>", opts)
	-- bufmap(bufnr, "n", "]g", ":lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = 'rounded' }})<CR>", opts)

	-- vim.cmd[[
	-- imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
	-- smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
	-- imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
	-- smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
	-- ]]
end

mappings.terminal = function()
	map("n", "<Leader>t", ":lua require 'modules.terminal'.term_toggle('vertical')<CR>",   opts)
	map("n", "<Leader>T", ":lua require 'modules.terminal'.term_toggle('horizontal')<CR>", opts)
end

mappings.telescope = function()
	map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", opts)
	map("n", "<Leader>lg", ":Telescope live_grep<CR>",              opts)
	map("n", "<Leader>gc", ":Telescope git_commits<CR>",            opts)

	-- Custom finders
	map("n", "<Leader>nv", ":lua require 'configs.telescope'.search_neovim()<CR>",   opts)
	map("n", "<Leader>df", ":lua require 'configs.telescope'.search_dotfiles()<CR>", opts)
end

mappings.easyAlign = function()
	map("x", "ga", "<Plug>(EasyAlign)", {})
end

mappings.trouble = function()
	map("n", "<Leader>x", ":TroubleToggle lsp_document_diagnostics<CR>",  opts)
	map("n", "<Leader>X", ":TroubleToggle lsp_workspace_diagnostics<CR>", opts)
end

mappings.harpoon = function()
	map("n", "<Leader>`", ":lua require 'harpoon.mark'.add_file()<CR>",        opts)
	-- map("n", "<Leader>hh", ":lua require 'harpoon.ui'.toggle_quick_menu()<CR>", opts)

	map("n", "<Leader>1", ":lua require 'harpoon.ui'.nav_file(1)<CR>", opts)
	map("n", "<Leader>2", ":lua require 'harpoon.ui'.nav_file(2)<CR>", opts)
	map("n", "<Leader>3", ":lua require 'harpoon.ui'.nav_file(3)<CR>", opts)
	map("n", "<Leader>4", ":lua require 'harpoon.ui'.nav_file(4)<CR>", opts)
end

return mappings
