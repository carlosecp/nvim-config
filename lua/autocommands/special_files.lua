local utils = require("autocommands.utils")

local augroup = utils.create_augroup("SpecialFiles")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = ".prettierc",
	callback = function()
		vim.schedule(function()
			vim.bo.filetype = "json"
		end)
	end,
	group = augroup
})
