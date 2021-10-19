local installer = require "nvim-lsp-installer"
local configs = require "modules.lsp.configs"
local commons = require "modules.lsp.commons"

local function setup_severs()
	installer.on_server_ready(function(server)
		local opts = configs[server.name] or {}

		opts.capabilities = commons.capabilities
		opts.on_attach = commons.on_attach

		server:setup(opts)
		vim.cmd[[ do User LspAttachBuffers ]]
	end)
end

local function setup_lsp()
	commons.setup.diagnostics()
	commons.setup.floating_windows()
	setup_severs()
end

setup_lsp()

