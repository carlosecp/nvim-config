local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

local server_configs = require "modules.lsp.server_configs"
local setup = require "modules.lsp.setup"

local function common_on_attach(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	require "core.mappings".lsp(bufnr)
end

lsp_installer.on_server_ready(function(server)
	local capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities())

	local server_config = server_configs[server.name] or {}
	server_config.capabilities = capabilities
	server_config.on_attach = common_on_attach

	if server.name == "tsserver" then
		server_config.init_options = require "nvim-lsp-ts-utils".init_options
		server_config.on_attach = function(client, bufnr)
			local ts_utils = require "nvim-lsp-ts-utils"
			ts_utils.setup({
				debug = false,
				disable_commands = false,
				enable_import_on_completion = false,

				-- import all
				import_all_timeout = 5000, -- ms
				-- lower numbers = higher priority
				import_all_priorities = {
					same_file = 1, -- add to existing import statement
					local_files = 2, -- git files or files with relative path markers
					buffer_content = 3, -- loaded buffer content
					buffers = 4, -- loaded buffer names
				},
				import_all_scan_buffers = 100,
				import_all_select_source = false,
				-- if false will avoid organizing imports
				always_organize_imports = true,

				-- filter diagnostics
				filter_out_diagnostics_by_severity = {},
				filter_out_diagnostics_by_code = {},

				-- inlay hints
				auto_inlay_hints = true,
				inlay_hints_highlight = "Comment",
				inlay_hints_priority = 200, -- priority of the hint extmarks
				inlay_hints_throttle = 150, -- throttle the inlay hint request
				inlay_hints_format = { -- format options for individual hint kind
					Type = {},
					Parameter = {},
					Enum = {},
					-- Example format customization for `Type` kind:
					-- Type = {
					--     highlight = "Comment",
					--     text = function(text)
					--         return "->" .. text:sub(2)
					--     end,
					-- },
				},

				-- update imports on file move
				update_imports_on_move = false,
				require_confirmation_on_move = false,
				watch_dir = nil,
			})
			ts_utils.setup_client(client)
		end
	end

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

