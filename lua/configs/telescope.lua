local telescope = require "telescope"

telescope.setup {
	defaults = {
		file_ignore_patterns = { "node_modules/", ".next/", ".git/" },
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
			}
		}
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

--- Custom Finders
local finders = {}

-- Search inside my dotfiles directory
finders.search_dotfiles = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Dotfiles",
		cwd = "/home/itscarlosecp/dotfiles",
		hidden = true
	}
end

-- Search inside my Neovim config
finders.search_neovim = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Neovim",
		cwd = "/home/itscarlosecp/.config/nvim",
		hidden = true
	}
end

return finders
