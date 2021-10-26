local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local util = require "lspconfig.util"
local commons = require "modules.lsp.commons"

-- emmet_language_server
-- Installation: npm install -g @kozer/emmet-language-server
if not lspconfig.emmet_language_server then
	configs.emmet_language_server = {
		default_config = {
			cmd = { "emmet-language-server", "--stdio" },
			filetypes = {
				"html", "typescriptreact", "javascriptreact", "javascript",
				"typescript", "javascript.jsx", "typescript.tsx", "css"
			},
			root_dir = util.root_pattern("package.json", ".git"),
			settings = {}
		}
	}
end

lspconfig.emmet_language_server.setup {
	capabilities = commons.capabilities,
	on_attach = commons.on_attach,
}
