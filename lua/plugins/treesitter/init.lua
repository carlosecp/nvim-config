require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	},
	indent = { enable = false },
	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "<C-i>",
      node_incremental  = "<C-i>",
      scope_incremental = "<C-u>",
      node_decremental  = "<C-m>",
    }
  },
	autotag = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = false
	}
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"

vim.cmd[[
syntax match Todo   " \[_\]" conceal cchar=
syntax match Todo   " \[X\]"  conceal cchar=
]]
