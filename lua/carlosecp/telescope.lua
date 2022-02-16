local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
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
})

telescope.load_extension("fzf")

local M = {}

M.dotfiles_finder = function()
	builtin.find_files({
		prompt_title = "Search Dotfiles",
		cwd = "/home/carlosecp/.dotfiles",
		hidden = true
	})
end

M.neovim_finder = function()
	builtin.find_files({
		prompt_title = "Search Neovim",
		cwd = "/home/carlosecp/.config/nvim",
		hidden = true
	})
end

return M
