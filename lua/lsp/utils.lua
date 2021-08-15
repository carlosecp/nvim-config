local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

local U = {}

U.common_on_attach = function()
	require "lsp_signature".on_attach {
		bind = true,
		fix_pos = true,
		handler_opts = {
			border = "single"
		}
	}

	map("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "[g", "<cmd>lua vim.lsp.buf.diagnostics.goto_next()<CR>", opts)
	map("n", "]g", "<cmd>lua vim.lsp.buf.diagnostics.goto_prev()<CR>", opts)

	-- ThePrimeagen: https://www.youtube.com/watch?v=IoyW8XYGqjM
	-- Autocmd to populate diagnositcs localist on events
	vim.cmd[[
	augroup UPDATE_DIAGNOSTICS
		autocmd!
		autocmd! BufWrite    * :lua vim.lsp.diagnostic.set_loclist { open_loclist = false }
		autocmd! BufEnter    * :lua vim.lsp.diagnostic.set_loclist { open_loclist = false }
		autocmd! InsertLeave * :lua vim.lsp.diagnostic.set_loclist { open_loclist = false }
	augroup END
	]]
end

U.common_capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  }
}
end

return U
