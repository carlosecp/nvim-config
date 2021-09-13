require "nvim-treesitter.configs".setup {
	--- ### BUILTIN MODULES ###
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
		custom_captures = {
			["struct"] = "Struct",
			["identifier"] = "Variable"
		}
	},
	indent   = { enable = false },

	-- ### THID-PARTY MODULES ###
	autotag  = { enable = true },
	rainbow  = {
		enable = false,
		extended_mode = false,
		colors = _G.itscarlosecp.plugins.rainbow
	},

	-- Native LSP action capabilities
	refactor = {
		highlight_definitions = { enable = true }
	},

	-- Treesitter Text-Objects
	 textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner"
      }
    },
		swap = {
			enable = true,
			swap_next = {
				["<Leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<Leader>A"] = "@parameter.inner",
			}
		}
  },

	-- Treesitter Playground
	playground = {
		enable          = true,
		disable         = {},
		updatetime      = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor       = "o",
			toggle_hl_groups          = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes    = "a",
			toggle_language_display   = "I",
			focus_language            = "f",
			unfocus_language          = "F",
			update                    = "R",
			goto_node                 = "<cr>",
			show_help                 = "?"
		}
	}
}

-- ### CUSTOM PARSERS ###
-- Use the jsonc parser for standard json files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsonc.used_by = "json"
