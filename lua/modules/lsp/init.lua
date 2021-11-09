local lsp_installer = require "nvim-lsp-installer"
local providers     = require "modules.lsp.providers"
local defaults      = require "modules.lsp.defaults"
local setup         = require "modules.lsp.setup"
local null_ls       = require "null-ls"

lsp_installer.on_server_ready(function(server)
	local opts = providers[server.name] or {}

	opts.capabilities = defaults.capabilities
	opts.on_attach    = defaults.on_attach

	setup.floating_windows()
	setup.diagnostics()

	server:setup(opts)
end)

null_ls.config {
	sources = {
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.stylua
	}
}

require "lspconfig"["null-ls"].setup {
	on_attach = defaults.on_attach
}

