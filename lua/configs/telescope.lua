require "telescope".setup {
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

require "telescope".load_extension("fzf")

--- Custom Finders
local cstm_finders = {}

-- Search inside my dotfiles directory
cstm_finders.search_dotfiles = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Dotfiles",
		cwd = "/home/cecp01/dotfiles",
		hidden = true
	}
end

-- Search inside my Neovim config
cstm_finders.search_neovim = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Neovim",
		cwd = "/home/cecp01/.config/nvim",
		hidden = true
	}
end

return cstm_finders
