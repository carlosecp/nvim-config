-- twilight.nvim
-- Dim inactive portions of the code you're editing using TreeSitter.
-- https://github.com/folke/twilight.nvim

local twilight = require("twilight")

twilight.setup({
	context = 1,
	expand = {
		"function",
		"method"
	}
})
