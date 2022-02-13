local M = {}

M.setup = function()
	local diagnostic_config = {
		virtual_text = true,
		update_in_insert = false,
		underline = true,
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

return M
