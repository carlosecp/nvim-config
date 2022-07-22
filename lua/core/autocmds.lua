local utils = require("core.utils")

local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = create_augroup("PlantUML"),
	pattern = { "*.pu", "*.uml", "*.puml", "*.iuml", "*.plantuml" },
	callback = function()
		vim.bo.filetype = "plantuml"
	end
})

local skeletons_group = create_augroup("Skeletons")
local skeletons_dir = vim.fn.stdpath("config") .. "/template/"
vim.api.nvim_create_autocmd("BufNewFile", {
	group = skeletons_group,
	pattern = "*html",
	command = "0r" .. skeletons_dir .. "skeleton.html"
})
