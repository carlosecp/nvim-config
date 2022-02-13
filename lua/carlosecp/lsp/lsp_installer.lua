local status_ok_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok_installer then return end

local status_ok_handlers, handlers = pcall(require, "carlosecp.lsp.handlers")
if not status_ok_handlers then return end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("carlosecp.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_lua_opts = require("carlosecp.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
	end

	server:setup(opts)
end)
