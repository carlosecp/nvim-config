local lspconfig  = require "lspconfig"
local lspinstall = require "lspinstall"
local configs    = require "modules.lsp.configs"
local commons    = require "modules.lsp.commons"

local function load_servers()
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

-- Reload LSPInstall after installing a server
function lspinstall.post_install_hook()
	load_servers()
	vim.cmd("bufdo e")
end

-- Start servers with defined configs and defaults
local function setup_servers()
	commons.setup.diagnostics()
	commons.setup.floating_windows()
	load_servers()
end

setup_servers()
