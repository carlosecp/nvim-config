-- nvim-treesitter
-- Nvim Treesitter configurations and abstraction layer.
-- https://github.com/nvim-treesitter/nvim-treesitter

local configs = require("nvim-treesitter.configs")
local parsers = require("nvim-treesitter.parsers")

configs.setup {
	ensure_installed = "all",
	highlight = {
		enable = { "python" },
		disable = {},
		additional_vim_regex_highlighting = true
	},
	indent = {
		enable = false,
		disable = { "lua", "python" }
	},
	refactor = {
		highlight_definitions = {
			enable = false,
			clear_on_cursor_move = true
		}
	}
}

local parser_config = parsers.get_parser_configs()
parser_config.jsonc.filetype_to_parsername = "json"
