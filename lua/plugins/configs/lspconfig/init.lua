local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_ok_lspconfig then return end

local handlers = require("plugins.configs.lspconfig.handlers") 
local mappings = require("core.mappings")

local default_opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities
}

local function with_default_opts(opts)
	return vim.tbl_deep_extend("force", default_opts, opts)
end

-- Available servers:
-- :h lspconfig-server-configurations

lspconfig.gopls.setup(default_opts)

lspconfig.rust_analyzer.setup(default_opts)

local tsserver_opts = require("plugins.configs.lspconfig.server_configs.tsserver")
lspconfig.tsserver.setup(with_default_opts(tsserver_opts))

local jsonls_opts = require("plugins.configs.lspconfig.server_configs.jsonls")
lspconfig.jsonls.setup(with_default_opts(jsonls_opts))

local tailwindcss_opts = require("plugins.configs.lspconfig.server_configs.tailwindcss")
lspconfig.tailwindcss.setup(with_default_opts(tailwindcss_opts))

local status_ok_fidget, fidget = pcall(require, "fidget")

if status_ok_fidget then 
	fidget.setup({
		fmt    = { stack_upwards = false },
		window = { blend = 0 }
	})
end

require("plugins.configs.null_ls")
