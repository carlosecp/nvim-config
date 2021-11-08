local map  = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

vim.g.mapleader = " "

map("n", "<Leader>h",        "<cmd>noh<CR>",            opts)
map("n", "<Leader><Leader>", "<C-^>",               opts)
map("n", "<C-J>",            "<C-W><C-J>",          { noremap = true })
map("n", "<C-K>",            "<C-W><C-K>",          { noremap = true })
map("n", "<C-L>",            "<C-W><C-L>",          { noremap = true })
map("n", "<C-H>",            "<C-W><C-H>",          { noremap = true })
map("n", "<C-Up>",           "<cmd>resize +5<CR>",      opts)
map("n", "<C-Down>",         "<cmd>resize -5<CR>",      opts)
map("n", "<C-Right>",        "<cmd>vert resize +5<CR>", opts)
map("n", "<C-Left>",         "<cmd>vert resize -5<CR>", opts)
map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
map("n", "<Leader>cc", "<cmd>execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' <cmd> '')<CR>", opts)

local mappings = {}

function mappings.terminal()
	map("n", "<Leader>t", "<cmd>lua require 'modules.terminal'.term_toggle()<CR>", opts)
	vim.cmd("tnoremap <Esc> <C-\\><C-n>")
end

function mappings.nvimtree()
	map("n", "<Leader>e",  "<cmd>NvimTreeToggle<CR>", opts)
end

function mappings.lsp()
	map("n", "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",          opts)
	map("n", "gs",         "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",     opts)
	map("n", "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",    opts)
	map("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",         opts)
	map("n", "gc",         "<cmd>lua vim.lsp.buf.code_action()<CR>",    opts)

	local popup_opts = "popup_opts = { border = 'rounded' }"
	map("n", "[g", "<cmd>lua vim.lsp.diagnostic.goto_next({" .. popup_opts .. "})<CR>", opts)
	map("n", "]g", "<cmd>lua vim.lsp.diagnostic.goto_prev({" .. popup_opts .. "})<CR>", opts)

	vim.cmd[[
	imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' <cmd> '<Tab>'
	smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' <cmd> '<Tab>'
	imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' <cmd> '<S-Tab>'
	smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' <cmd> '<S-Tab>'
	]]
end

function mappings.telescope()
	map("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opts)
	map("n", "<Leader>lg", "<cmd>Telescope live_grep<CR>", opts)
	map("n", "<Leader>nv", "<cmd>lua require 'configs.telescope'.search_neovim()<CR>", opts)
	map("n", "<Leader>df", "<cmd>lua require 'configs.telescope'.search_dotfiles()<CR>", opts)
end

function mappings.easyAlign()
	map("x", "ga", "<Plug>(EasyAlign)", {})
end

return mappings
