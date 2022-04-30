local lspconfig = require("lspconfig")
local handlers = require("lsp.handlers")

handlers.setup()

local opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities
}

local opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities
}

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup(opts)

-- npm install -g vscode-langservers-extracted
local jsonls_opts = require("lsp.settings.jsonls")
lspconfig.jsonls.setup(vim.tbl_deep_extend("force", opts, jsonls_opts))

-- npm install -g @tailwindcss/language-server
lspconfig.tailwindcss.setup(opts)

-- https://github.com/georgewfraser/java-language-server

require("fidget").setup({
	fmt = { stack_upwards = false }
})

require("lsp.null_ls")
