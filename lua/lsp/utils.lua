local function defineSings(signs)
	for sign_name, icon in ipairs(signs) do
		vim.fn.sign_define(sign_name, {
			texthl = sign_name,
			text = icon,
			numhl = sign_name
		})
	end
end

local signs = {
  LspDiagnosticsSignError = "",
  LspDiagnosticsSignWarning = "",
  LspDiagnosticsSignHint = "",
  LspDiagnosticsSignInformation = "",
}

defineSings(signs)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    signs     = true,
    underline = true,
    virtual_text = {
      prefix  = "",
      spacing = 0
    },
		update_in_insert = true
  }
)

vim.lsp.protocol.CompletionItemKind = {
  "   (Text)",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}

local M = {}

M.common_on_attach = function()
	vim.cmd[[nnoremap <silent> K  <cmd>lua vim.lsp.buf.hover()           <CR>]]
	vim.cmd[[nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()      <CR>]]
	vim.cmd[[nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()     <CR>]]
	vim.cmd[[nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()  <CR>]]
	vim.cmd[[nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>]]
	vim.cmd[[nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]]

	-- ThePrimeagen: https://www.youtube.com/watch?v=IoyW8XYGqjM
	-- Autocmd to populate diagnositcs localist on events
	vim.cmd[[
	augroup UPDATE_DIAGNOSTICS
		autocmd!
		autocmd! BufWrite,BufEnter,InsertLeave * :lua vim.lsp.diagnostic.set_loclist { open_loclist = false }
	augroup NED
	]]
end

return M
