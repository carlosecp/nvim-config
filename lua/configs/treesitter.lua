local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
	return
end

configs.setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		disable = { "html" },
		additional_vim_regex_highlighting = true
	},
	indent = {
		enable = false,
		disable = { }
	},
	refactor = {
		highlight_definitions = { enable = true }
	}
}

local parsers_status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_status_ok then
	return
end

-- Use the jsonc parser for standard JSON files
local parser_config = parsers.get_parser_configs()
parser_config.jsonc.used_by = "json"
