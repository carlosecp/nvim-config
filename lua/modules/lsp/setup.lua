local setup = {}

-- Hover and Diagnositcs popup windows
function setup.floating_windows()
	vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded"
	})

	vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded"
	})
end

local function aux_set_signcolumn_sign(diag_type, sign)
	vim.fn.sign_define(diag_type, {
		text = sign,
		numhl = diag_type
	})
end

-- Diagnostics signs
function setup.diagnostics()
	-- Setting signcolumn signs
	aux_set_signcolumn_sign("LspDiagnosticsSignError",          "")
	aux_set_signcolumn_sign("LspDiagnosticsSignWarning",        "")
	aux_set_signcolumn_sign("LspDiagnosticsDefaultInformation", "")
	aux_set_signcolumn_sign("LspDiagnosticsDefaultHint",        "")

	-- Diagnositcs windows/virtual text
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			spacing = 0,
			prefix = ""
		}
	})
end


return setup
