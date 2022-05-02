-- telescope.nvim
-- Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim

local telescope = require "telescope"
local builtin = require "telescope.builtin"

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules/", ".next/", ".git/" },
		sorting_strategy = "ascending"
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
})

telescope.load_extension("fzf")

local M = {}

M.project_files = function()
	local ok = pcall(builtin.git_files, { hidden = true })
	if not ok then builtin.find_files({ hidden = true }) end
end

M.search_dotfiles = function()
	builtin.find_files({
		prompt_title = "Search Dotfiles",
		cwd = "$HOME/.dotfiles",
		hidden = true
	})
end

M.search_neovim = function()
	builtin.find_files({
		prompt_title = "Search Neovim",
		cwd = "$HOME/.config/nvim",
		hidden = true
	})
end

return M
