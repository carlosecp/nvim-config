--[[
	ITSCARLOSECP.NVIM
• Author: Carlos Castillo (itscarlosecp)
• Github: https://github.com/itscarlosecp
]]

_G.itscarlosecp = {
	borders = "rounded"
}

require "core.options"
require "core.mappings"
require "core.utils"
require "core.plugins"
require "core.commands"

require "modules.lsp"
require "modules.terminal"
require "modules.netrw"
require "modules.statusline"

