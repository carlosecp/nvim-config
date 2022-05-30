local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local ft_associations_augroup = create_augroup("FileTypeAssocations")
local associate_fts = function(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		callback = function()
			vim.shedule(function()
				vim.bo.filetype = filetype
			end)
		end,
		group = ft_associations_augroup
	})
end

-- Take .prettierc file as regular JSON
associate_fts(".prettierc", "json")
-- Take multiple UML extensions just as regular UML
associate_fts({ "*.pu", "*.uml", "*.puml", "*.iuml", "*.plantuml" }, "uml")

local disable_winbar = create_augroup("DisableWinbar")
vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
	callback = function()
		local winbar_filetype_exclude = {
      "help",
      "packer",
      "NvimTree",
      "alpha",
			"TelescopePrompt"
    }

		if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
			vim.opt_local.winbar = nil
			return
		end

		-- vim.opt_local.winbar = "%=%m %f"
	end
})
