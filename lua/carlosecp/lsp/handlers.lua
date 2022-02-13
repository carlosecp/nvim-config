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

	-- Bindings
	vim.keymap.set("n", "K",  vim.lsp.buf.hover,          { noremap = true })
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { noremap = true })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition,     { noremap = true })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration,    { noremap = true })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true })
	vim.keymap.set("n", "gr", vim.lsp.buf.references,     { noremap = true })
	vim.keymap.set("n", "gx", vim.lsp.buf.signature_help, { noremap = true })

	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename,      { noremap = true })
	vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { noremap = true })

	vim.keymap.set("n", "[g", vim.diagnostic.goto_next, { noremap = true })
	vim.keymap.set("n", "]g", vim.diagnostic.goto_prev, { noremap = true })
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	M.capabilities = capabilities
	return M
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
