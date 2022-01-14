local mappings = {}

mappings.setup = function()
	local diagnostic_config = {
		virtual_text = true,
		update_in_insert = true,
		underline = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = ""
		}
	}

	vim.diagnostic.config(diagnostic_config)

	vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded"
	})

	vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded"
	})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

mappings.on_attach = function(client, bufnr)
	if client.name == "tailwindcss" then
		if client.server_capabilities.colorProvider then
			require "cecp01.lsp.settings.tailwindcss.documentcolors".buf_attach(bufnr)
		end
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
	end

	if client.name == "tsserver" then
		local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
		if status_ok then
			ts_utils.setup {}
			ts_utils.setup_client(client)
		end
	end

	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	require "cecp01.core.mappings".lsp(bufnr)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	mappings.capabilities = capabilities
	return mappings
end

mappings.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return mappings
