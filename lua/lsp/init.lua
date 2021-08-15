local lspconfig   = require "lspconfig"
local lspinstall  = require "lspinstall"
local lsp_configs = require "lsp.configs"
local lsp_utils   = require "lsp.utils"

local configs = {
	json = lsp_configs.json,
	lua = lsp_.configs.lua
}

local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    local client = lspconfig[server]
    local config = configs[server] or client

    client.setup {
      filetypes = config.filetypes or client.filetypes,
      on_attach = config.on_attach or lsp_utils.common_on_attach,
      settings  = config.settings or {}
    }
  end
end

setup_servers()

lspinstall.post_install_hook = function()
  setup_servers()
  vim.cmd("bufdo e")
end
