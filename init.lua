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

-- Sources core defaults
require "core.settings"
require "core.mappings"
require "core.commands"
require "core.utils"

-- Plugins and LSP
require "core.plugins"
require "modules.lsp"
require "core.colors"("nord")
