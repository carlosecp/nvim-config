local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require "cecp01.lsp.handlers".on_attach,
		capabilities = require "cecp01.lsp.handlers".capabilities
	}

	if server.name == "jsonls" then
		local jsonls_opts = require "cecp01.lsp.settings.jsonls"
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_lua_opts = require "cecp01.lsp.settings.sumneko_lua"
		opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
	end

	server:setup(opts)
end)
