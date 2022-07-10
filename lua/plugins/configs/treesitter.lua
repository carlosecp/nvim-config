local status_ok_configs, configs = pcall(require, "nvim-treesitter.configs")
local status_ok_parsers, parsers = pcall(require, "nvim-treesitter.parsers")

if not status_ok_configs or not status_ok_configs then return end

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
		enable = true,
		disable = { "lua", "python" }
	},
	refactor = {
		highlight_definitions = {
			enable = false,
			clear_on_cursor_move = true
		},
		smart_rename = {
			enable  = true,
			keymaps = {
				smart_rename = defaults.mappings.rename
			}
		}
	}
})

local parser_config = parsers.get_parser_configs()
parser_config.jsonc.filetype_to_parsername = "json"
