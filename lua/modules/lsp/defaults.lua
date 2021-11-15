local defaults = {}

defaults.capabilities = vim.lsp.protocol.make_client_capabilities()
defaults.capabilities.textDocument.completion.completionItem.snippetSupport = true

function defaults.on_attach(client)
	client.resolved_capabilities.document_formatting = false
	require "core.mappings".lsp()
end

return defaults
