local installer = require "nvim-lsp-installer.servers"
local commons = require "modules.lsp.commons"

local L = {}

function L.setup(server_name, opts)
	local ok, server = installer.get_server(server_name)

	if ok then
		if not server:is_installed() then server:install() end

		opts.capabilities = commons.capabilities
		opts.on_attach = commons.on_attach

		server:setup(opts)
		vim.cmd[[ do User LspAttachBuffers ]]
	end
end

return L
