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
		enable = true,
		extended_mode = false,
		colors = {
			"#ffcb12",
			"#a563d6",
			"#c6e6ff"
		}
	},
	refactor = {
		highlight_definitions = { enable = true }
	}
}

-- Use the jsonc parser for standard json files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"
