local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local filetype_associations = function(pattern, filetype)
	local augroup = create_augroup("SpecialFiles")
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		callback = function()
			vim.shedule(function()
				vim.bo.filetype = filetype
			end)
		end,
		group = augroup
	})
end

-- Take .prettierc file as regular JSON
filetype_associations(".prettierc", "json")
-- Take multiple UML extensions just as regular UML
filetype_associations({ "*.pu", "*.uml", "*.puml", "*.iuml", "*.plantuml" }, "uml")
