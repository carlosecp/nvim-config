local utils = require("core.utils")

local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local qf_list_window_mappings = create_augroup("QFListWindowMappings")

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter" }, {
	pattern = "quickfix",
	callback = function()
		-- utils.map("n", "j", ":cnext<CR>", { buffer = true })
		-- utils.map("n", "k", ":cprev<CR>", { buffer = true })
	end,
	group = qf_list_window_mappings
})
