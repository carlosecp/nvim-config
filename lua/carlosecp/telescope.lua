local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup {
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
}

telescope.load_extension("fzf")

local builtin = require("telescope.builtin")

local M = {}

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
