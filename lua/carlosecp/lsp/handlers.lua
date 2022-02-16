local M = {}

M.setup = function()
	local diagnostic_config = {
		virtual_text     = true,
		update_in_insert = true,
		underline        = true,
		float = {
			focusable = false,
			style  = "minimal",
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
	require("carlosecp.keymappings").lsp_keymappings()
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
