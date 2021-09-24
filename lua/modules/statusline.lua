local M = {}

local colors = {
	active   = "%#StatusLine#",
	inactive = "%#StatusLineNC#",
	line_col = "%#LineCol#",
	mode     = "%#Mode#",
}

M.modes = setmetatable({
	["n" ] = "Normal",
	["no"] = "N·Pending",
	["v" ] = "Visual",
	["V" ] = "V·Line",
	[""] = "V·Block",
	["s" ] = "Select",
	["S" ] = "S·Line",
	[""] = "S·Block",
	["i" ] = "Insert",
	["ic"] = "Insert",
	["R" ] = "Replace",
	["Rv"] = "V·Replace",
	["c" ] = "Command",
	["cv"] = "Vim·Ex",
	["ce"] = "Ex",
	["r" ] = "Prompt",
	["rm"] = "More",
	["r?"] = "Confirm",
	["!" ] = "Shell",
	["t" ] = "Terminal"
}, {
	__index = function()
		return "Unknown"
	end
})

M.special_files = {
	[""] = "",
	["NvimTree"] = " NvimTree "
}

function M.get_current_mode(self)
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", self.modes[current_mode])
end

function M.get_branch()
		local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
		if branch == "" then return branch else return string.format("  %s ", branch) end
end

function M.get_filename(self)
	local filename, extension = vim.fn.expand("%:t"), vim.fn.expand("%:e")
	local icon = require "nvim-web-devicons".get_icon(filename, extension, { default = true })
	local filetype = vim.bo.filetype

	if self.special_files[filetype] ~= nil then return self.special_files[filetype] end
	return string.format(" %s %s ", icon, filename)
end

function M.get_filetype()
	local filetype = vim.bo.filetype
	if filetype == "" then return "" else return string.format("[%s]", filetype) end
end

function M.get_line_col()
  return " %l:%c  %2p%% "
end

function M.set_active(self)
	local mode     = colors.mode .. self:get_current_mode()
	local branch   = colors.active .. self:get_branch()
	local filename = self:get_filename()
	local filetype = self:get_filetype()
	local line_col = self:get_line_col()

	return table.concat({
		mode, branch, "%=", filename, "%=", filetype, line_col
	})
end

function M.set_inactive(self)
	local filename = self:get_filename()
	return table.concat({ filename })
end

function M.set_explorer(self)
	return self.special_files["NvimTree"]
end

Statusline = setmetatable(M, {
	__call = function(statusline, mode)
		if mode == "active" then return statusline:set_active() end
		if mode == "inactive" then return statusline:set_inactive() end
		if mode == "explorer" then return statusline:set_explorer() end
	end
})

vim.cmd[[
	augroup Statusline
		au!
		au WinEnter,BufEnter * setlocal statusline=%{%v:lua.Statusline('active')%}
		au WinLeave,BufLeave * setlocal statusline=%{%v:lua.Statusline('inactive')%}
		au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%{%v:lua.Statusline('explorer')%}
	augroup END
]]
