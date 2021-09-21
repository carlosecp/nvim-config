require "nvim-treesitter.configs".setup {
	--- ### BUILTIN MODULES ###
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

	-- ### THID-PARTY MODULES ###
	rainbow  = {
		enable = true,
		extended_mode = false,
		colors = {
			"#ffcb12",
			"#a563d6",
			"#c6e6ff"
		}
	},

	-- Native LSP action capabilities
	refactor = {
		highlight_definitions = { enable = true }
	},

	-- Treesitter Playground
	playground = { enable = true }
}

-- ### CUSTOM PARSERS ###
-- Use the jsonc parser for standard json files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"
