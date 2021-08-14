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
