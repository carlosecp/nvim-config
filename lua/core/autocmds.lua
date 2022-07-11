local utils = require("core.utils")

local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local plantuml_group = create_augroup("PlantUMLGroup")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.pu", "*.uml", "*.puml", "*.iuml", "*.plantuml" },
	callback = function()
		vim.bo.filetype = "plantuml"
	end,
	group = plantuml_group
})
