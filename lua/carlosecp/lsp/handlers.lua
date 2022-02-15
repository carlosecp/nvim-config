local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.on_attach = function(client, bufnr)
	if client.name == "tailwindcss" then
		if client.server_capabilities.colorProvider then
			require("carlosecp.lsp.settings.tailwindcss.documentcolors").buf_attach(bufnr)
		end
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
	end

	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	require("carlosecp.keymappings").lsp()
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	M.capabilities = capabilities
	return M
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
