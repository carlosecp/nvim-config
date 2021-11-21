require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		disable = { "html" },
		additional_vim_regex_highlighting = true
	},
	indent = {
		enable = false,
		disable = {}
	},
	refactor = {
		highlight_definitions = { enable = true }
	},
	 playground = {
    enable = true
  }
}

-- Use the jsonc parser for standard json files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"
