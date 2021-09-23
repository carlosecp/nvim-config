local opt = vim.api.nvim_set_option

vim.g.currentmode = {
	["n"]  = "Normal",
	["no"] = "Normal",
	["v"]  = "Visual",
	["V"]  = "Visual",
	["s"]  = "Select",
	["S"]  = "Select",
	["i"]  = "Insert",
	["ic"] = "Insert",
	["ix"] = "Insert",
	["R"]  = "Replace",
	["Rc"] = "Replace",
	["Rv"] = "Replace",
	["Rx"] = "Replace",
	["c"]  = "Command",
	["cv"] = "Command",
	["ce"] = "Command",
	["!"]  = "Shell",
	["t"]  = "Terminal",
}

local function git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if branch == "" then return branch else return "  " .. branch .. " " end
end

local function statusline(value)
	local section = vim.go.statusline .. value
	opt("statusline", section)
end

local function section_mode()
	statusline("%#VimMode#")
	statusline(" ")
	vim.cmd[[set statusline+=%{g:currentmode[mode()]}]]
	statusline(" ")
end

local function section_cursor()
	statusline("[%l:%c]")
	statusline("[%2p%%]")
end

local function set_statusline()
	section_mode()
	statusline("%#StatusLine#")
	statusline(git_branch())
	statusline("%=")
	vim.cmd[[set statusline+=%{expand('%:~:.')}]]
	statusline("%=")
	section_cursor()
	statusline(" ")
end

set_statusline()
