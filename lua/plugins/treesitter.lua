local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

local status_ok, treesitter_parsers = pcall(require, "nvim-treesitter.parsers")
if not status_ok then return end

treesitter_configs.setup {
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
		highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = { smart_rename = "<Leader>rn", }
    }
	}
}

-- Use the jsonc parser for standard json files
local parser_config = treesitter_parsers.get_parser_configs()
parser_config.jsonc.used_by = "json"
