local map  = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

vim.g.mapleader = " "

-- Buffers/Panes navigation
map("n", "<Leader><Leader>", "<C-^>", opts)
map("n", "<C-J>",     "<C-W><C-J>",          { noremap = true })
map("n", "<C-K>",     "<C-W><C-K>",          { noremap = true })
map("n", "<C-L>",     "<C-W><C-L>",          { noremap = true })
map("n", "<C-H>",     "<C-W><C-H>",          { noremap = true })
map("n", "<C-Up>",    ":resize +5<CR>",      opts)
map("n", "<C-Down>",  ":resize -5<CR>",      opts)
map("n", "<C-Right>", ":vert resize +5<CR>", opts)
map("n", "<C-Left>",  ":vert resize -5<CR>", opts)

-- Better undoing
map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })

-- Terminal escape
vim.cmd("tnoremap <Esc> <C-\\><C-n>")

-- Others
map("n", "<Leader>cc", ":execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '')<CR>", opts)

local M = {}

function M.terminal()
	map("n", "<Leader>t", ":lua require 'modules.terminal'.termToggle()<CR>", opts)
	vim.cmd("tnoremap <Esc> <C-\\><C-n>")
end

function M.nvimtree()
	map("n", "<Leader>e",  ":NvimTreeToggle<CR>", opts)
end

function M.lsp()
	map("n", "K",          ":lua vim.lsp.buf.hover()<CR>",          opts)
	map("n", "gs",         ":lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "gd",         ":lua vim.lsp.buf.definition()<CR>",     opts)
	map("n", "gD",         ":lua vim.lsp.buf.declaration()<CR>",    opts)
	map("n", "<Leader>rn", ":lua vim.lsp.buf.rename()<CR>",         opts)
	map("n", "gc",         ":lua vim.lsp.buf.code_action()<CR>",    opts)

	local popup_opts = string.format("popup_opts = { border = %s }", _G.itscarlosecp.borders)
	map("n", "[g", ":lua vim.lsp.diagnostic.goto_next({" .. popup_opts .. "})<CR>", opts)
	map("n", "]g", ":lua vim.lsp.diagnostic.goto_prev({" .. popup_opts .. "})<CR>", opts)

	vim.cmd[[
	imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
	smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
	imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
	smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
	]]
end

function M.telescope()
	map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", opts)
	map("n", "<Leader>lg", ":Telescope live_grep<CR>", opts)
	map("n", "<Leader>nv", ":lua require 'configs.telescope'.search_neovim()<CR>", opts)
	map("n", "<Leader>df", ":lua require 'configs.telescope'.search_dotfiles()<CR>", opts)
end

function M.easyAlign()
	map("x", "ga", "<Plug>(EasyAlign)", {})
end

return M
