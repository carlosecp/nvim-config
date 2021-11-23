local capabilities = {}

return {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.server_capabilities.colorProvider then
			require "modules.lsp.documentcolors".buf_attach(bufnr)
		end
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
	end
}
