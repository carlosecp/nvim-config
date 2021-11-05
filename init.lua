--[[
	ITSCARLOSECP.NVIM
• Author: Carlos Castillo (itscarlosecp)
• Github: https://github.com/itscarlosecp
]]

_G.itscarlosecp = {
	borders = nil
}

require "core.options"
require "core.mappings"
require "core.utils"
require "core.plugins"
require "core.commands"

require "modules.explorer"
require "modules.statusline"
require "modules.lsp"
require "modules.terminal"

