local servers = {}

servers.jsonls = {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			schemas = {
				{
					description = "TypeScript compiler configuration file",
					fileMatch = {
						"tsconfig.json",
						"tsconfig.*.json",
					},
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					description = "ESLint config",
					fileMatch = {
						".eslintrc.json",
						".eslintrc",
					},
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					description = "Prettier config",
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc",
				},
				{
					description = "NPM configuration file",
					fileMatch = {
						"package.json",
					},
					url = "https://json.schemastore.org/package.json",
				}
			}
		}
	}
}

servers.sumneko_lua = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
}

servers.emmet_ls = { -- npm install -g ls_emmet
	cmd = { "ls_emmet", "--stdio" },
	filetypes = { "html", "css", "scss", "javascript", "javascriptreact",
	"typescript", "typescriptreact" }
}

return servers
