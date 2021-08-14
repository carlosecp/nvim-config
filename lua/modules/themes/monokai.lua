local lush = require "lush"
local hsl = lush.hsl

local p = {
	ui = {
		bg = hsl("#1f1f1f"),
		explorer_bg = hsl("#161616")
	},
	syntax = {}
}

local theme = lush(function()
  return {
		Normal { bg = p.ui.bg },
		NvimTreeNormal { bg = p.ui.explorer_bg }
	}
end)

return theme

