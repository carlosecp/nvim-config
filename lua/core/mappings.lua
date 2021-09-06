--[[ Keymappings for default Neovim actions
and specific plugins. These function are called
from the plugins file to be activated after
loading their respective plugins.
]]

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

-- ### NEOVIM ###
-- Mapleader
vim.g.mapleader = " "

-- Buffers/Panes navigation
map("n", "<Leader><Leader>", "<C-^>", opts)
map("n", "<C-J>", "<C-W><C-J>", { noremap = true })
map("n", "<C-K>", "<C-W><C-K>", { noremap = true })
map("n", "<C-L>", "<C-W><C-L>", { noremap = true })
map("n", "<C-H>", "<C-W><C-H>", { noremap = true })

map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })

--- ### PLUGINS ###
local M = {}

-- NvimTree
function M.nvimTree()
	map("n", "<Leader>e",  "<cmd>NvimTreeToggle<CR>", opts)
end

-- Telescope
function M.telescope()
	map("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opts)
	map("n", "<Leader>lg", "<cmd>Telescope live_grep<CR>", opts)
	map("n", "<Leader>gc", "<cmd>Telescope git_commits<CR>", opts)
	map("n", "<Leader>nv", "<cmd>lua require 'plugins.telescope'.search_neovim()<CR>", opts)
	map("n", "<Leader>df", "<cmd>lua require 'plugins.telescope'.search_dotfiles()<CR>", opts)
	map("n", "<Leader>cs", "<cmd>lua require 'plugins.telescope'.colorscheme()<CR>", opts)
end

-- EasyAlign
function M.easyAlign()
	map("x", "ga", "<Plug>(EasyAlign)", {})
end

-- Toggle Terminal
-- Custom terminal module
function M.toggleTerminal()
	map("n", "<Leader>t", "<cmd>lua require 'modules.terminal'.termToggle()<CR>", opts)
	vim.cmd("tnoremap <Esc> <C-\\><C-n>")
end

return M
