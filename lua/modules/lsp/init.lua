local lsp_installer = require "nvim-lsp-installer"
local cstm_configs  = require "modules.lsp.cstm_configs"
local setup         = require "modules.lsp.setup"

local function common_on_attach(_, bufnr)
	require "core.mappings".lsp(bufnr)
end

lsp_installer.on_server_ready(function(server)
	local capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities())

	local server_config = cstm_configs[server.name] or {}
	server_config.capabilities = capabilities
	server_config.on_attach = common_on_attach

	if server.name == "tailwindcss" then
		server_config.on_attach = function (client, bufnr)
			if client.server_capabilities.colorProvider then
				require"modules.lsp.documentcolors".buf_attach(bufnr)
			end
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.colorProvider = { dynamicRegistration = false }
			common_on_attach(client, bufnr)
		end
	end

	setup.floating_windows()
	setup.diagnostics()

	server:setup(server_config)
end)
