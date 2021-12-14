local lspconfig     = require "lspconfig"
local lsp_installer = require "nvim-lsp-installer"
local cstm_configs  = require "modules.lsp.cstm_configs"
local setup         = require "modules.lsp.setup"
local null_ls       = require "null-ls"

local function common_on_attach(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	require "core.mappings".lsp(bufnr)
end

lsp_installer.on_server_ready(function(server)
	local capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities())

	local server_config = cstm_configs[server.name] or {}
	server_config.capabilities = capabilities
	server_config.on_attach = common_on_attach

	if server.name == "tailwindcss" then
		server_config.on_attach = function(client, bufnr)
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

null_ls.config {
    sources = {
			-- null_ls.builtins.formatting.prettier,     -- npm install -g prettier
			null_ls.builtins.formatting.prettierd,    -- npm install -g @fsouza/prettierd
			null_ls.builtins.formatting.clang_format, -- sudo pacman -S clang
			null_ls.builtins.formatting.gofmt,        -- included with go
      null_ls.builtins.formatting.autopep8,     -- pip install autopep8
      null_ls.builtins.formatting.rustfmt       -- rustfmt
		}
}

lspconfig["null-ls"].setup {
    on_attach = common_on_attach
}

