require "telescope".setup {
	defaults = {
		file_ignore_patterns = {"node_modules/", ".next/", ".git/"},
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

require "telescope".load_extension("fzf")

--- Custom Finders
local F = {}

-- Search inside my dotfiles directory
F.search_dotfiles = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Dotfiles",
		cwd = "/home/itscarlosecp/dotfiles",
		hidden = true
	}
end

-- Search inside my Neovim config
F.search_neovim = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Neovim",
		cwd = "/home/itscarlosecp/.config/nvim",
		hidden = true
	}
end

return F
