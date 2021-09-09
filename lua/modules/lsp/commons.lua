local C = { setup = {} }

-- ### SERVER DEFAULTS ###
C.capabilities = vim.lsp.protocol.make_client_capabilities()
C.capabilities.textDocument.completion.completionItem.snippetSupport = true

function C.on_attach(client)
	-- Disable LSP's builtin formatters
	client.resolved_capabilities.document_formatting = false

	-- Use default LSP mappings
	require "core.mappings".lsp()
end

-- ### NEOVIM LSP CLIENT SETUP ###
-- Hover and Diagnositcs popup windows
function C.setup.floating_windows()
	vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(vim.lsp.handlers.hover, {
		border = _G.itscarlosecp.borders
	})

	vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = _G.itscarlosecp.borders
	})
end

local function aux_set_signcolumn_sign(diag_type, sign)
	vim.fn.sign_define(diag_type, {
		text = sign,
		numhl = diag_type
	})
end

-- Diagnostics signs
function C.setup.diagnostics()
	-- Setting signcolumn signs
	aux_set_signcolumn_sign("LspDiagnosticsSignError",          "")
	aux_set_signcolumn_sign("LspDiagnosticsSignWarning",        "")
	aux_set_signcolumn_sign("LspDiagnosticsDefaultInformation", "")
	aux_set_signcolumn_sign("LspDiagnosticsDefaultHint",        "")

	-- Diagnositcs windows/virtual text
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			spacing = 0
		}
	})
end

return C
