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
• Borders hardcoded in diagnostics mappings
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
		},
		rainbow = {
			"#ffcb12",
			"#a563d6",
			"#c6e6ff"
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
-- To install new language servers:
-- :LspInstall <lang_name>
require "modules.lsp"

-- Colorscheme
vim.cmd[[colorscheme tokyonight]]

