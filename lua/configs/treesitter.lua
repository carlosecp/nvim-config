require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	},
	indent   = { enable = false },
	autotag  = { enable = true },
	rainbow  = {
		enable = true,
		extended_mode = false
	},

	-- Add native LSP action capabilities (super awesome)
	refactor = {
		highlight_definitions = { enable = true }
	},

	-- Treesitter playground
	playground = {
		enable          = true,
		disable         = {},
		updatetime      = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor       = "o",
			toggle_hl_groups          = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes    = "a",
			toggle_language_display   = "I",
			focus_language            = "f",
			unfocus_language          = "F",
			update                    = "R",
			goto_node                 = "<cr>",
			show_help                 = "?"
		}
	}
}

-- Use the jsonc parser for standard json files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"
