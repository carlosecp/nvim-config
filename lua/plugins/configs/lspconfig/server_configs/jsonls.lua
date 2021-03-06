return {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			schemas = {
				{
					description = "TypeScript compiler configuration file",
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					description = "ESLint config",
					fileMatch = { ".eslintrc.json", ".eslintrc" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					description = "Prettier config",
					fileMatch = { ".prettierrc" },
					url = "https://json.schemastore.org/prettierrc",
				},
				{
					description = "NPM configuration file",
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					description = "JavaScript interpreter configuration",
					fileMatch = { "jsconfig.json", "jsconfig.*.json" },
					url = "https://json.schemastore.org/jsconfig.json",
				},
			}
		}
	}
}
