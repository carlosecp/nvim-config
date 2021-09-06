--[[
	itscarlosecp.nvim
• Author: Carlos Castillo (itscarlosecp)
• Github: https://github.com/itscarlosecp

	"Clean and simple Neovim configuration written
	in Lua. Easy to configure to your own liking."
]]

-- Source Defaults
require "core.settings"
require "core.mappings"
require "core.commands"

-- Third-party Plugins
_G.plugins = { autopairs = false }
require "core.plugins"

-- Custom Modules
-- To install new language servers:
-- :LspInstall <lang_name>
require "modules.lsp"
require "modules.terminal"

-- Colorscheme
vim.cmd[[colorscheme github]]

