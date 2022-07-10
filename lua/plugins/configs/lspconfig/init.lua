local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_ok_lspconfig then return end

local handlers = require("plugins.configs.lspconfig.handlers") 
local mappings = require("core.mappings")

local default_opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities
}

-- Available servers:
-- :h lspconfig-server-configurations

-- paru -S gopls
lspconfig.gopls.setup(default_opts)

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup(default_opts)

-- npm install -g @tailwindcss/language-server
lspconfig.tailwindcss.setup(vim.tbl_deep_extend("force", default_opts, {
	on_attach = function(client, bufnr)
		if client.server_capabilities.colorProvider then
			require("plugins.configs.lspconfig.server_configs.tailwindcss.documentcolors").buf_attach(bufnr)
		end
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
		default_opts.on_attach(client, bufnr)
	end
}))

local status_ok_fidget, fidget = pcall(require, "fidget")

if status_ok_fidget then 
	fidget.setup({
		fmt    = { stack_upwards = false },
		window = { blend = 0 }
	})
end

require("plugins.configs.null_ls")
