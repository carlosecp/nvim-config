-- Require packages
local lspconfig  = require "lspconfig"
local lspinstall = require "lspinstall"
-- Defaults
local configs = require "modules.lsp.configs"
local commons = require "modules.lsp.commons"

local function setup_servers()
	lspinstall.setup()
	local servers = lspinstall.installed_servers()

	for _, server in pairs(servers) do
		local client = lspconfig[server]
		local config = configs[server] or client

		client.setup {
			capabilities = commons.capabilities,
			filetypes    = config.filetypes or client.filetypes,
			on_attach    = config.on_attach or commons.on_attach,
			settings     = config.settings or {}
		}
	end
end

lspinstall.post_install_hook = function ()
	setup_servers()
	vim.cmd("bufdo e")
end

local function setup()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			spacing = 0
		}
	})
	setup_servers()
end

setup()
