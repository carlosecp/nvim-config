--[[
	╔═══════════════════╗
	║ ITSCARLOSECP.NVIM ║
	╚═══════════════════╝
• Author: Carlos Castillo (itscarlosecp)
• Github: https://github.com/itscarlosecp
]]

_G.itscarlosecp = {
	borders = "rounded",
	plugins = {
		telescope = {
			paths = {
				dotfiles = "$HOME/dotfiles",
				neovim   = "$HOME/.config/nvim",
				themes   = "$HOME/themes.nvim"
			}
		}
	}
}

require "core.settings"
require "core.mappings"
require "core.utils"
require "core.plugins"
require "core.commands"

require "modules.statusline"
require "modules.lsp"
require "themes"("nord")
