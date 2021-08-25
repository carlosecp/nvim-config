local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

local C = {}

C.capabilities = vim.lsp.protocol.make_client_capabilities()
C.capabilities = require "cmp_nvim_lsp".update_capabilities(C.capabilities)

C.common_on_attach = function()
	-- Enable LSPSignature
	require "lsp_signature".on_attach {
		bind = true,
		fix_pos = true,
		handler_opts = {
			border = "single"
		}
	}

	-- Native LSP Mapping
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	-- LSPSaga Mappings
	map("n", "K",  "<cmd>Lspsaga hover_doc<CR>", opts)
	map("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
	map("n", "rn", "<cmd>Lspsaga rename<CR>", opts)
	map("n", "[g", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	map("n", "]g", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
end

return C

