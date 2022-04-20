-- nvim-treesitter
-- Nvim Treesitter configurations and abstraction layer.
-- https://github.com/nvim-treesitter/nvim-treesitter

local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		disable = { "html" },
		additional_vim_regex_highlighting = true
	},
	indent = {
		enable = { "python" },
		disable = {}
	},
	refactor = {
		highlight_definitions = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = { smart_rename = "<Leader>rn" }
		}
	}
})

local parsers = require("nvim-treesitter.parsers")

local parser_config = parsers.get_parser_configs()
parser_config.jsonc.filetype_to_parsername = "json"
