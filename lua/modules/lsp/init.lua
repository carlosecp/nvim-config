local lspconfig = require "lspconfig"
local lspinstall = require "lspinstall"

local function common_on_attach()
	vim.cmd[[nnoremap <silent> K  <cmd>lua vim.lsp.buf.hover()           <CR>]]
	vim.cmd[[nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()      <CR>]]
	vim.cmd[[nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()     <CR>]]
	vim.cmd[[nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()  <CR>]]
	vim.cmd[[nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>]]
	vim.cmd[[nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]]

	-- ThePrimeagen: https://www.youtube.com/watch?v=IoyW8XYGqjM
	-- Autocmd to populate diagnositcs localist on events
	vim.cmd[[
	augroup UPDATE_DIAGNOSTICS
		autocmd!
		autocmd! BufWrite,BufEnter,InsertLeave * :lua vim.lsp.diagnostic.set_loclist { open_loclist = false }
	augroup NED
	]]
end

local configs = {
	json = require "modules.lsp.servers.json",
	lua  = require "modules.lsp.servers.lua",
}

local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    local client = lspconfig[server]
    local config = configs[server] or client

    client.setup {
      filetypes = config.filetypes or client.filetypes,
      on_attach = config.on_attach or common_on_attach,
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
