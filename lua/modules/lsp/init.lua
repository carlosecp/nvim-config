local lspconfig = require "lspconfig"
local commons = require "modules.lsp.commons"

local common_setup = {
	capabilities = commons.capabilities,
	on_attach = commons.on_attach,
}

-- sumneko_lua
require "modules.lsp.servers.sumneko_lua"

-- clangd
-- Installation: sudo pacman -S clang
lspconfig.clangd.setup(common_setup)

-- javascript/typescript
-- Installation: npm install -g typescript typescript-language-server
lspconfig.tsserver.setup(common_setup)

-- TailwindCSS
-- Installation: npm install -g @tailwindcss/language-server
lspconfig.tailwindcss.setup(common_setup)

-- emmet-language-server
require "modules.lsp.servers.emmet-language-server"
