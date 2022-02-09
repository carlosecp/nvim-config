local M = {}

local global_borders = _G.carlosecp.borders
local borders = global_borders and global_borders or "single"

M.setup = function()
	local diagnostic_config = {
		virtual_text = true,
		update_in_insert = false,
		underline = true,
		float = {
			focusable = false,
			style  = "minimal",
			border = borders,
			source = "always",
			header = "",
			prefix = ""
		}
	}

	vim.diagnostic.config(diagnostic_config)

	vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(vim.lsp.handlers.hover, {
		border = borders
	})

	vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = borders
	})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.on_attach = function(client, bufnr)
	if client.name == "tailwindcss" then
		if client.server_capabilities.colorProvider then
			require "lsp.settings.tailwindcss.documentcolors".buf_attach(bufnr)
		end
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
	end

	if client.name == "tsserver" then
		local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
		if status_ok then
			ts_utils.setup({})
			ts_utils.setup_client(client)
		end
	end

	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	-- Bindings
	vim.keymap.set("n", "K",  vim.lsp.buf.hover,          noremap)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, noremap)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition,     noremap)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration,    noremap)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, noremap)
	vim.keymap.set("n", "gr", vim.lsp.buf.references,     noremap)
	vim.keymap.set("n", "gx", vim.lsp.buf.signature_help, noremap)

	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename,         noremap)
	vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action,    noremap)

	vim.keymap.set("n", "[g", vim.diagnostic.goto_next, noremap)
	vim.keymap.set("n", "]g", vim.diagnostic.goto_prev, noremap)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	M.capabilities = capabilities
	return M
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
