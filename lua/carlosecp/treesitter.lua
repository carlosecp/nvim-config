local configs = require("nvim-treesitter.configs")
local parsers = require("nvim-treesitter.parsers")

configs.setup({
	ensure_installed = "maintained",
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
	}
})

local parser_config = parsers.get_parser_configs()
parser_config.jsonc.filetype_to_parsername = "json"
