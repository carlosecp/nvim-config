local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

vim.g.mapleader = " "

map("n", "<C-J>", "<C-W><C-J>", { noremap = true })
map("n", "<C-K>", "<C-W><C-K>", { noremap = true })
map("n", "<C-L>", "<C-W><C-L>", { noremap = true })
map("n", "<C-H>", "<C-W><C-H>", { noremap = true })

map("n", "n", "nzz",   { noremap = true })
map("n", "N", "Nzz",   { noremap = true })

map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })

-- Terminal
map("n", "<Leader>t", "<cmd>lua require 'modules.terminal'.termToggle()<CR>", opts)
vim.cmd("tnoremap <Esc> <C-\\><C-n>")

-- Telescope
map("n", "<Leader>e",  "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opts)
map("n", "<Leader>lg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<Leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<Leader>nv", "<cmd>lua require 'plugins.telescope'.search_neovim()<CR>", opts)
map("n", "<Leader>df", "<cmd>lua require 'plugins.telescope'.search_dotfiles()<CR>", opts)
map("n", "<Leader>cs", "<cmd>lua require 'plugins.telescope'.colorscheme()<CR>", opts)

map("x", "ga", "<Plug>(EasyAlign)", {})

-- Conquer of Completion
map("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
map("n", "[g", "<Plug>(coc-diagnostic-prev)", opts)
map("n", "]g", "<Plug>(coc-diagnostic-next)", opts)
map("n", "gd", "<Plug>(coc-definition)", opts)
map("n", "<Leader>rn", "<Plug>(coc-rename)", opts)
