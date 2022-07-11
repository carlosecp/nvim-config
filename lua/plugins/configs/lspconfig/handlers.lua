local mappings = require("core.mappings")
local utils    = require("core.utils")
local defaults = utils.defaults

local M = {}

local diagnostic_config = {
	virtual_text     = true,
	update_in_insert = true,
	underline        = true,
	float = {
		focusable = false,
		style     = "minimal",
		border    = defaults.borders,
		source    = "always",
		header    = "",
		prefix    = ""
	}
}

vim.diagnostic.config(diagnostic_config)

vim.lsp.handlers["textDocument/hover"] =
vim.lsp.with(vim.lsp.handlers.hover, {
	border    = defaults.borders,
	-- max_width = 80
})

vim.lsp.handlers["textDocument/signatureHelp"] =
vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = defaults.borders
})

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
   documentationFormat  = { "markdown", "plaintext" },
   snippetSupport       = true,
   preselectSupport     = true,
   insertReplaceSupport = true,
   labelDetailsSupport  = true,
   deprecatedSupport    = true,
   commitCharactersSupport = true,
   tagSupport = { valueSet = { 1 } },
   resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits"
      }
   }
}

function M.on_attach(client, bufnr)
	mappings.lsp()
end

return M
