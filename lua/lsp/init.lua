-- :h lspconfig-server-configurations
local lspconfig = require("lspconfig")
local handlers = require("lsp.handlers")
local fidget = require("fidget")

handlers.setup()

local setup = function(server_name)
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities
	}

	if server_anem == "jsonls" then
		opts = vim.tbl_deep_extend(opts, require("lsp.configs.jsonls"))
	end

	lspconfig[server_name].setup(opts)
end

-- paru -S jdtls
setup("jdtls")

-- npm i -g tailw
setup("tailwindcss")

-- paru -S rust-analyzer
-- setup("rust_analyzer")

-- npm i -g typescript-language-server
setup("tsserver")

fidget.setup {
	fmt = { stack_upwards = false },
	window = { blend = 0 }
}

require("lsp.null_ls")
