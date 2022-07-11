local handlers = require("plugins.configs.lspconfig.handlers")
local default_on_attach = handlers.on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

return {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.server_capabilities.colorProvider then
			require("plugins.configs.lspconfig.server_configs.tailwindcss.documentcolors").buf_attach(bufnr)
		end
		default_on_attach(client, bufnr)
	end
}
