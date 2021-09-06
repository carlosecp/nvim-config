--[[
	╔═══════════════════╗
	║ ITSCARLOSECP.NVIM ║
	╚═══════════════════╝
• Author: Carlos Castillo (itscarlosecp)
• Github: https://github.com/itscarlosecp

	"Clean and simple Neovim configuration written
	in Lua. Easy to configure to your own liking."
]]

--[[
TODO: Pending tasks/configs
• Implement snippets support
]]

-- ### GLOBAL CONFIG ###
-- Values that I want to keep unified and
-- are used in many places.
_G.itscarlosecp = {
	borders = "rounded",
	plugins = {
		autopairs = false
	}
}

-- ### DEFAULTS ###
-- Sources core defaults
require "core.settings"
require "core.mappings"
require "core.commands"
require "core.utils"

-- ### PLUGINS ####
-- Plugins list
require "core.plugins"

-- ### LANGUAGE SERVERS ###
-- To install new language servers:
-- :LspInstall <lang_name>
require "modules.lsp"

-- ### CUSTOM MODULES ###
-- Toggle terminal
require "modules.terminal"

-- Colorscheme
vim.cmd[[colorscheme github]]

