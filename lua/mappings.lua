local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

vim.g.mapleader = " "

map("n", "<C-J>", "<C-W><C-J>", { noremap = true })
map("n", "<C-K>", "<C-W><C-K>", { noremap = true })
map("n", "<C-L>", "<C-W><C-L>", { noremap = true })
map("n", "<C-H>", "<C-W><C-H>", { noremap = true })

map("n", "n", "nzz",   { noremap = true })
map("n", "N", "Nzz",   { noremap = true })
map("n", "J", "mzJ`z", { noremap = true })

map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })

map("n", "<Leader>t", "<cmd>lua require 'modules.terminal'.termToggle()<CR>", opts)
map("n", "<Esc>", "<C-\\n><C-n>", opts)

map("n", "<Leader>e",  "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opts)
map("n", "<Leader>lg", "<cmd>Telescope live_grep", opts)
map("n", "<Leader>gc", "<cmd>Telescope git_commits", opts)

map("x", "ga", "<Plug>(EasyAlign)", {})
