local lspconfig  = require "lspconfig"
local lspinstall = require "lspinstall"
local commons    = require "modules.lsp.commons"

local configs = {
	json = require "modules.lsp.configs.json",
	lua  = require "modules.lsp.configs.lua",
}

local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    local client = lspconfig[server]
    local config = configs[server] or client

    client.setup {
      filetypes = config.filetypes or client.filetypes,
      on_attach = config.on_attach or commons.on_attach,
      settings  = config.settings or {}
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don"t have to restart neovim
require "lspinstall".post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

