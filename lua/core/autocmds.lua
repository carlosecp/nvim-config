local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local augroup = create_augroup("SpecialFiles")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = ".prettierc",
	callback = function()
		vim.schedule(function()
			vim.bo.filetype = "json"
		end)
	end,
	group = augroup
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.pu", "*.uml", "*.puml", "*.iuml", "*.plantuml" },
	callback = function()
		vim.schedule(function()
			vim.bo.filetype = "uml"
		end)
	end,
	group = augroup
})
