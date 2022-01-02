local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

local status_ok, cstm_configs = pcall(require, "modules.lsp.cstm_configs")
if not status_ok then return end

local status_ok, setup = pcall(require, "modules.lsp.setup")
if not status_ok then return end

local function common_on_attach(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	require "core.mappings".lsp(bufnr)
end

lsp_installer.on_server_ready(function(server)
	local status_ok, nvim_cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		local capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities())
	else
		local capabilities = vim.lsp.protocol.make_client_capabilities()
	end

	local server_config = cstm_configs[server.name] or {}
	server_config.capabilities = capabilities
	server_config.on_attach = common_on_attach

	if server.name == "tailwindcss" then
		server_config.on_attach = function(client, bufnr)
			if client.server_capabilities.colorProvider then
				require "modules.lsp.documentcolors".buf_attach(bufnr)
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

