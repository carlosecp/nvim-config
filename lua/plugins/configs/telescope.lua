local status_ok_telescope, telescope = pcall(require, "telescope")

if not status_ok_telescope then return end

local builtin = require("telescope.builtin")

telescope.setup({
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
})

telescope.load_extension("fzf")
