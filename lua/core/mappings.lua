local utils = require("core.utils")

local defaults = utils.defaults
local localmap = utils.localmap
local map = utils.map

vim.g.mapleader = " "

map("n", "<Leader>h", ":noh<CR>")
map("x", "<Leader>s", ":sort<CR>")

map("n", "<Leader>cc", function()
	local colorcolumn = vim.wo.colorcolumn
	vim.wo.colorcolumn = string.len(colorcolumn) == 0 and "80" or ""
end)

map("n", "<Leader>ss", function()
	local state = vim.wo.signcolumn
	vim.wo.signcolumn = state == "yes" and "no" or "yes"
end)

map("n", "<C-Up>",    ":res +2<CR>")
map("n", "<C-Down>",  ":res -2<CR>")
map("n", "<C-Right>", ":vert res +2<CR>")
map("n", "<C-Left>",  ":vert res -2<CR>")

map("n", "<C-n>", ":cn<CR>")
map("n", "<C-p>", ":cp<CR>")

map("n", "<C-s>", R)

local M = {}

function M.easy_align()
	map("x", "ga", "<Plug>(EasyAlign)")
end

function M.lsp()
	localmap("n", "K",          vim.lsp.buf.hover)
	localmap("n", "gs",         vim.lsp.buf.signature_help)
	localmap("n", "gd",         vim.lsp.buf.definition)
	localmap("n", "gD",         vim.lsp.buf.declaration)
	localmap("n", "<Leader>gr", vim.lsp.buf.references)
	localmap("n", "<Leader>ca", vim.lsp.buf.code_action)
	localmap("n", "[g",         vim.diagnostic.goto_next)
	localmap("n", "]g",         vim.diagnostic.goto_prev)
	localmap("n", defaults.mappings.rename, vim.lsp.buf.rename)

	localmap("n", "<Leader>x", function()
		vim.lsp.buf.format({ async = true })
	end)

	localmap("n", "<Leader>gx", function()
		require("diaglist").open_all_diagnostics()
	end)
end

function M.null_ls()
	localmap("n", "<Leader>x", function(bufnr)
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "null-ls"
			end
		})
	end)
end

function M.netrw()
	map("n", "<Leader>e", ":Explore<CR>")
end

function M.nvimtree()
	map("n", "<Leader>e", ":NvimTreeToggle<CR>")
end

function M.telescope()
	map("n", "<Leader>ff", function()
		require("telescope.builtin").find_files({ hidden = true })
	end)

	map("n", "<Leader>lg", function()
		require("telescope.builtin").live_grep({ hidden = true })
	end)

	map("n", "<Leader>df", function()
		require("telescope.builtin").find_files({
			prompt_title = "Search Dotfiles",
			cwd = "$HOME/.dotfiles",
			hidden = true
		})
	end)

	map("n", "<Leader>nv", function()
		require("telescope.builtin").find_files({
			prompt_title = "Search Nvim Config",
			cwd = "$HOME/.config/nvim",
			hidden = true
		})
	end)

	map("n", "<Leader>fp", function()
		require("telescope.builtin").find_files({
			prompt_title = "Search Installed Plugins",
			cwd = vim.fn.stdpath("data") .. "/site/pack/packer",
			hidden = true
		})
	end)
end

return M
