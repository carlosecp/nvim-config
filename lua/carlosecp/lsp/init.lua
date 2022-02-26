local lsp_installer = require("nvim-lsp-installer")
local handlers = require("carlosecp.lsp.handlers")

handlers.setup()

require("fidget").setup({
	fmt = { stack_upwards = false }
})

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

require("carlosecp.lsp.null_ls")
