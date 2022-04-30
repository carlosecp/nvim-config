vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

local handlers = require("lsp.handlers")

local jdtls_cache_dir = vim.fn.stdpath("cache") .. "/jdtls/"
local jdtls_config_dir = jdtls_cache_dir .. "config_linux"
local jdtls_workspace_dir = jdtls_cache_dir .. "jdtls-workspace"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
	cmd = {
		"jdtls",
		"-configuration", jdtls_config_dir,
		"-data", jdtls_workspace_dir .. "-" .. project_name
	},
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities
}

require("jdtls").start_or_attach(config)
