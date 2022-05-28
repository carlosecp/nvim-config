local status_ok_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok_installer then return end
local handlers = require("plugins.lsp.handlers")

handlers.setup()

local default_config = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities
}

local custom_setup = {
	jsonls = require("plugins.lsp.configs.jsonls")
}

lsp_installer.on_server_ready(function(server)
	local config = custom_setup[server.name] or {}
	config = vim.tbl_deep_extend("force", config, default_config)
	server:setup(config)
end)

local status_ok_fidget, fidget = pcall(require, "fidget")
if not status_ok_fidget then return end

fidget.setup {
	fmt = { stack_upwards = false }
}

require("plugins.lsp.null_ls")
