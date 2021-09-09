--[[ Configuration tables for language servers that
need customization. You can find the valid keys here:
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
]]
local null_ls = require "null-ls"
local prettier_rc_path = vim.fn.expand("$HOME/.config/nvim/utils/.prettierrc")

local C = {}

C.json = {
	filetypes = {"json", "jsonc"},
	settings = {
		json = {
			schemas = {
				{
					fileMatch = {"package.json"},
					url = "https://json.schemastore.org/package.json"
				},
				{
					fileMatch = {"jsconfig*.json"},
					url = "https://json.schemastore.org/jsconfig.json"
				},
				{
					fileMatch = {"tsconfig*.json"},
					url = "https://json.schemastore.org/tsconfig.json"
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json"
					},
					url = "https://json.schemastore.org/prettierrc.json"
				},
				{
					fileMatch = {".eslintrc", ".eslintrc.json"},
					url = "https://json.schemastore.org/eslintrc.json"
				}
			}
		}
	}
}

C.lua = {
	settings = {
		Lua = {
			diagnostics = {
				globals = {"vim", "awesome"}
			}
		}
	}
}

C.null_ls = {
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettierd.with {
			extra_args = { "--config", prettier_rc_path }
		}
	}
}

return C
