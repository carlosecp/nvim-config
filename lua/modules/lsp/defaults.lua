local opts = { silent = true, noremap = true }

local defaults = {}

defaults.capabilities = vim.lsp.protocol.make_client_capabilities()
defaults.capabilities.textDocument.completion.completionItem.snippetSupport = false

function defaults.on_attach(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	buf_set_keymap("n", "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",          opts)
	buf_set_keymap("n", "gs",         "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",     opts)
	buf_set_keymap("n", "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",    opts)
	buf_set_keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",         opts)
	buf_set_keymap("n", "gc",         "<cmd>lua vim.lsp.buf.code_action()<CR>",    opts)

	local popup_opts = "popup_opts = { border = 'rounded' }"
	buf_set_keymap("n", "[g", "<cmd>lua vim.lsp.diagnostic.goto_next({" .. popup_opts .. "})<CR>", opts)
	buf_set_keymap("n", "]g", "<cmd>lua vim.lsp.diagnostic.goto_prev({" .. popup_opts .. "})<CR>", opts)

	vim.cmd[[
	imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
	smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
	imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
	smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
	]]

	buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

return defaults
