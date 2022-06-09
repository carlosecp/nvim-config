-- telescope.nvim
-- Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
	defaults = {
		file_ignore_patterns = { "node_modules/", ".next/", ".git/", "*.class" },
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top"
		},
		mappings = {
			i = {
				["<C-u>"] = { "<C-S-u>", type = "command" }
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
