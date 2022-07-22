local status_ok_configs, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok_configs then return end

local utils    = require("core.utils")
local defaults = utils.defaults

configs.setup({
	ensure_installed = "all",
	highlight = {
		enable  = true,
		disable = {},
		additional_vim_regex_highlighting = true
	},
	autotag = { 
		enable = true
	},
	indent = {
		enable = false
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			}
		}
	},
	playground = {
		enable = true
	}
})

local status_ok_parsers, parsers = pcall(require, "nvim-treesitter.parsers")

if not status_ok_parsers then return end

local parser_config = parsers.get_parser_configs()
parser_config.jsonc.filetype_to_parsername = "json"
