local trouble = require "trouble.providers.telescope"

require "telescope".setup {
	defaults = {
		file_ignore_patterns = {"node_modules", ".next", ".git"},
		color_devicons = true,
		mappings = {
			i = {
				["<C-q>"] = trouble.open_with_trouble
			}
		}
	}
}

local M = {}

M.search_dotfiles = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Dotfiles",
		cwd = "$HOME/.dotfiles",
		hidden = true
	}
end

M.search_neovim = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Neovim",
		cwd = "$HOME/.config/nvim",
		hidden = true
	}
end

return M
