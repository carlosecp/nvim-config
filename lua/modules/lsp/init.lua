local lsp_installer = require "nvim-lsp-installer"
local providers     = require "modules.lsp.providers"
local defaults      = require "modules.lsp.defaults"
local setup         = require "modules.lsp.setup"

lsp_installer.on_server_ready(function(server)
	local opts = providers[server.name] or {}

	opts.capabilities = defaults.capabilities
	opts.on_attach    = defaults.on_attach

	setup.floating_windows()
	setup.diagnostics()

	server:setup(opts)
end)
