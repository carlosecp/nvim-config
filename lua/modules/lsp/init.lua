local lspconfig = require "lspconfig"
local commons = require "modules.lsp.commons"

-- sumneko_lua
-- Installation: https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/
local sumneko_binary_path = vim.fn.exepath("lua-language-server")
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h:h")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
	cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
	capabilities = commons.capabilities,
	on_attach = commons.on_attach,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path
			},
			diagnostics = {
				globals = { "vim" }
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				maxPreload = 2000,
				preloadFileSize = 1000
			}
		}
	}
}

-- clangd
lspconfig.clangd.setup {
	capabilities = commons.capabilities,
	on_attach = commons.on_attach,
}
