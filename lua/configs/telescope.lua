require "telescope".setup {
	 defaults = {
		file_ignore_patterns = {"node_modules/", ".next/", ".git/"},
		previewer = false
	},
	-- pickers = {
		-- buffers = {
			-- previewer = false,
			-- theme = "dropdown"
		-- },
		-- find_files = {
			-- previewer = false,
			-- theme = "dropdown"
		-- }
	-- },
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

--- ### CUSTOM FINDERS ###
local F = {}

-- Search inside my dotfiles directory
local dotfiles_path = "$HOME/.dotfiles"
F.search_dotfiles = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Dotfiles",
		cwd = dotfiles_path,
		hidden = true
	}
end

-- Search inside my Neovim config
local nvim_config_path = "$HOME/.config/nvim"
F.search_neovim = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Neovim",
		cwd = nvim_config_path,
		hidden = true
	}
end

-- Search inside my custom colorschemes repo
local themes_nvim_path = "$HOME/themes.nvim"
F.colorscheme = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Colorscheme",
		cwd = themes_nvim_path,
		hidden = true
	}
end

return F
