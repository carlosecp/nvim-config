require "telescope".setup {
	 defaults = {
		file_ignore_patterns = {"node_modules/", ".next/", ".git/"},
		previewer = false
	},
	pickers = {
		buffers    = { previewer = false },
		find_files = { previewer = false }
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
		cwd = _G.itscarlosecp.plugins.telescope.paths.dotfiles,
		hidden = true
	}
end

-- Search inside my Neovim config
F.search_neovim = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Neovim",
		cwd = _G.itscarlosecp.plugins.telescope.paths.neovim,
		hidden = true
	}
end

-- Search inside my custom colorschemes repo
F.colorscheme = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Colorscheme",
		cwd = _G.itscarlosecp.plugins.telescope.paths.themes,
		hidden = true
	}
end

return F
