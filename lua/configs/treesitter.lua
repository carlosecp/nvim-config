require "nvim-treesitter.configs".setup {
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"tsx",
		"typescript",
		"vim",
		"yaml"
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	},
	indent   = { enable = false },
	autotag  = { enable = true },

	-- Add native LSP action capabilities (super awesome)
	refactor = {
		highlight_definitions = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<Leader>rn"
			}
		}
	},

	-- Playing with textobjects
	textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },

	-- Treesitter playground
	 playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false
  }
}

-- Use the jsonc parser for standard json files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"
