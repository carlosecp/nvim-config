--[[
	╔═══════════════════╗
	║ ITSCARLOSECP.NVIM ║
	╚═══════════════════╝
• Author: Carlos Castillo (itscarlosecp)
• Github: https://github.com/itscarlosecp
]]

-- ### GLOBAL CONFIG ###
-- Values that I want to keep unified and
-- are used in many places.
_G.itscarlosecp = {
	borders = "rounded",
	plugins = {
		formatter = {
			prettierrc = "$HOME/.config/nvim/utils/.prettierrc"
		},
		telescope = {
			paths = {
				dotfiles = "$HOME/dotfiles",
				neovim   = "$HOME/.config/nvim",
				themes   = "$HOME/themes.nvim"
			}
		}
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
require "modules.lsp"

-- ### UI ###
require "modules.statusline"
require "core.colors"("nord")
