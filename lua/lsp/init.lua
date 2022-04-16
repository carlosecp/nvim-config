local lspconfig = require("lspconfig")
local handlers = require("lsp.handlers")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

handlers.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local opts = {
	on_attach = handlers.on_attach,
	capabilities = capabilities
}

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup(opts)

-- npm install -g vscode-langservers-extracted
local jsonls_opts = require("lsp.settings.jsonls")
lspconfig.jsonls.setup(vim.tbl_deep_extend("force", opts, jsonls_opts))

-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
local sumneko_opts = require("lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", opts, sumneko_opts))

-- npm install -g @tailwindcss/language-server
lspconfig.tailwindcss.setup({})

require("fidget").setup({
	fmt = { stack_upwards = false }
})

require("lsp.null_ls")
