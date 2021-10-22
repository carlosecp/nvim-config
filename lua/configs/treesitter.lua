require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
		custom_captures = {
			["struct"] = "Struct",
			["identifier"] = "Variable"
		}
	},
	indent   = { enable = false },
	playground = { enable = true },
	rainbow  = {
		enable = false,
		extended_mode = false
	},
	refactor = {
		highlight_definitions = { enable = true }
	}
}

-- Use the jsonc parser for standard json files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"
