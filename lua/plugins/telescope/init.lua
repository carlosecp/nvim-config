require "telescope".setup {
	 defaults = {
		file_ignore_patterns = {"node_modules", ".next", ".git"},
		previewer = false
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

M.colorscheme = function()
	require "telescope.builtin".find_files {
		prompt_title = "Change Colorscheme",
		cwd = "$HOME/themes.nvim",
		hidden = true
	}
end

return M
