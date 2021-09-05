local map  = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

local C = {}

C.capabilities = vim.lsp.protocol.make_client_capabilities()
C.capabilities.textDocument.completion.completionItem.snippetSupport = true

function C.on_attach()
	-- Enable LSPSignature
	require "lsp_signature".on_attach {
		use_lspsaga = true
	}

	-- Language Server Protocol
	--[[ Some of this bindings are defined in nvim-treesitter config, because
	it uses it's syntax trees to interact with the native LSP.
	]]

	-- Native LSP Mapping
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	-- LSPSaga Mappings
	map("n", "K",  "<cmd>Lspsaga hover_doc<CR>", opts)
	map("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
	map("n", "gc", "<cmd>Lspsaga code_action<CR>", opts)
	map("n", "[g", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	map("n", "]g", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
end

return C
