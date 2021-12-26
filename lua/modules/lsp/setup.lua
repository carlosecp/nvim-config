local setup = {}

-- Hover and Diagnositcs popup windows
function setup.floating_windows()
	vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(vim.lsp.handlers.hover, {
		-- border = "rounded"
	})

	vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, {
		-- border = "rounded"
	})
end

-- Diagnostics signs
function setup.diagnostics()
	-- Setting signcolumn signs
	-- aux_set_signcolumn_sign("DiagnosticsSignError",          "")
	-- aux_set_signcolumn_sign("DiagnosticsSignWarning",        "")
	-- aux_set_signcolumn_sign("DiagnosticsDefaultInformation", "")
	-- aux_set_signcolumn_sign("DiagnosticsDefaultHint",        "")

	-- Diagnositcs windows/virtual text
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			spacing = 0,
			-- prefix = ""
		}
	})

	-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
end


return setup
