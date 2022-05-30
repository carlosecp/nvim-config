-- nvim-treesitter
-- Nvim Treesitter configurations and abstraction layer.
-- https://github.com/nvim-treesitter/nvim-treesitter

local configs = require("nvim-treesitter.configs")
local parsers = require("nvim-treesitter.parsers")

configs.setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true
	},
	indent = {
		enable = true,
		disable = {}
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
