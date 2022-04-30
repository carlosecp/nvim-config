local lsp_installer = require("nvim-lsp-installer")
local handlers = require("lsp.handlers")

handlers.setup()

local default_config = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities
}

local custom_setup = {
	jsonls = require("lsp.configs.jsonls")
}

lsp_installer.on_server_ready(function(server)
	local config = custom_setup[server.name] or {}
	config = vim.tbl_deep_extend("force", config, default_config)
	server:setup(config)
end)

require("fidget").setup({
	fmt = { stack_upwards = false }
})

require("lsp.null_ls")
