-- ### Install and load LSP configs
local lspconfig  = require "lspconfig"
local lspinstall = require "lspinstall"
local null_ls = require "null-ls"
-- ### Custom configs
-- Common utilities for LSPs and individual configs
local configs = require "modules.lsp.configs"
local commons = require "modules.lsp.commons"

-- ### LSPInstall ###
-- Use LSPInstall to install and load servers
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

-- ### NULL-LS ###
local function load_null_ls()
	null_ls.config(configs.null_ls)
	lspconfig["null-ls"].setup {
		on_attach = commons.on_attach
	}
end

-- Reload LSPInstall after installing a server
function lspinstall.post_install_hook()
	load_servers()
	load_null_ls()
	vim.cmd("bufdo e")
end

-- ### SETUP ###
-- Start servers with defined configs and defaults
local function setup_servers()
	commons.setup.diagnostics()
	commons.setup.floating_windows()
	load_servers()
	load_null_ls()
end

setup_servers()
