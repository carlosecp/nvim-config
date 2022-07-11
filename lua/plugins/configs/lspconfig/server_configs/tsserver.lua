local handlers = require("plugins.configs.lspconfig.handlers")
local default_on_attach = handlers.on_attach

return {
	init_options = {
		hostInfo = "neovim",
		preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true
		}
	},
	on_attach = function(client, bufnr)
		local status_ok_ts_utils, ts_utils = pcall(require, "nvim-lsp-ts-utils")

		if status_ok_ts_utils then
			ts_utils.setup({})
			ts_utils.setup_client(client)
		end

		default_on_attach(client, bufnr)
	end
}
