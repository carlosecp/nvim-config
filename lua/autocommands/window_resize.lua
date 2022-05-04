local utils = require "autocommands.utils"

local augroup = utils.create_augroup("WindowResize")

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.schedule(function()
			local columns = vim.api.nvim_win_get_width(0)
			if columns < 80 then
				vim.api.nvim_feedkeys("=", "m", true)
			else
				vim.api.nvim_feedkeys("")
			end
		end)
	end,
	group = augroup
})
