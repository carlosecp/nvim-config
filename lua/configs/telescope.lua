--	use {
--		"nvim-telescope/telescope.nvim",
--		cmd = "Telescope",
--		module = {
--			"telescope",
--			"telescope.builtin",
--			"configs.telescope"
--		},
--		config = function()
--			require "configs.telescope"
--		end,
--		setup = function()
--			require "core.mappings".telescope()
--		end,
--		requires = {{
--			"nvim-telescope/telescope-fzf-native.nvim",
--			run = "make"
--		}}
--	}

require "telescope".setup {
	 defaults = {
		file_ignore_patterns = {"node_modules/", ".next/", ".git/"}
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
		cwd = _G.itscarlosecp.plugins.fuzzy_finder.paths.dotfiles,
		hidden = true
	}
end

-- Search inside my Neovim config
F.search_neovim = function()
	require "telescope.builtin".find_files {
		prompt_title = "Search Neovim",
		cwd = _G.itscarlosecp.plugins.fuzzy_finder.paths.neovim,
		hidden = true
	}
end

return F
