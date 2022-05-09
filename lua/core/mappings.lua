local utils = require "core.utils"
local map = utils.map

map("n", "<Leader>h",        ":noh<CR>",         noremap)
map("n", "<Leader><Leader>", "<C-^>",            no_si)

-- resizing windows
map("n", "<C-Up>",":res +5<CR>")
map("n", "<C-Down>",":res -5<CR>")
map("n", "<C-Right>",":vert res +5<CR>")
map("n", "<C-Left>",":vert res -5<CR>")

map("n", "<Leader>cc", function()
    local colorcolumn = vim.wo.colorcolumn
    vim.wo.colorcolumn = string.len(colorcolumn) == 0 and "80" or ""
end, noremap)

-- mappings for plugins
local M = {}

function M.easy_align()
    map("x", "ga", "<Plug>(EasyAlign)", noremap)
end

function M.lsp()
    map("n", "K", vim.lsp.buf.hover)
    map("n", "gs", vim.lsp.buf.signature_help)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "gx", vim.lsp.buf.signature_help)
    map("n", "<Leader>rn", vim.lsp.buf.rename)
    map("n", "<Leader>ca", vim.lsp.buf.code_action)
    map("n", "[g", vim.diagnostic.goto_next)
    map("n", "]g", vim.diagnostic.goto_prev)
end

function M.null_ls()
    map("n", "<Leader>x", vim.lsp.buf.formatting, no_si_buf)
end

function M.nvimtree()
    map("n", "<Leader>e", ":NvimTreeToggle<CR>", noremap)
end

function M.telescope()
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
