local C = { setup = {} }

C.capabilities = vim.lsp.protocol.make_client_capabilities()
C.capabilities.textDocument.completion.completionItem.snippetSupport = false

function C.on_attach(client)
	client.resolved_capabilities.document_formatting       = false
	client.resolved_capabilities.document_range_formatting = false
	require "core.mappings".lsp()
end

function C.setup.diagnostics()
	vim.cmd[[
	sign define LspDiagnosticsSignError text=
	sign define LspDiagnosticsSignWarning text=
	sign define LspDiagnosticsSignInformation text=
	sign define LspDiagnosticsSignHint text=
	]]

	-- Diagnositcs windows/virtual text
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			spacing = 0
		}
	})
end

-- Hover and Diagnositcs popup windows
function C.setup.floating_windows()
	vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(vim.lsp.handlers.hover, {
		border = nil
	})

	vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = nil
	})
end

return C
