local utils = require("autocommands.utils")
local nvim_config_dir = vim.fn.stdpath("config") .. "/"
local templates_dir = nvim_config_dir .. "templates/"

local augroup = utils.create_augroup("Skeletons")

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.md",
	callback = function()
		vim.schedule(function()
			vim.cmd("0r " .. templates_dir .. "skeleton.md")
		end)
	end
})
