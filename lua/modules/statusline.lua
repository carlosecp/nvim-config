local vimModes = {
	["n"] = "normal",
	["no"] = "normal",
	["v"] = "visual",
	["V"] = "visual",
	["s"] = "select",
	["S"] = "select",
	["i"] = "insert",
	["ic"] = "insert",
	["ix"] = "insert",
	["R"] = "replace",
	["Rc"] = "replace",
	["Rv"] = "replace",
	["Rx"] = "replace",
	["c"] = "command",
	["cv"] = "command",
	["ce"] = "command",
	["!"] = "shell",
	["t"] = "terminal",
}

local function gitBranch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if branch == "" then
		return branch
	else
		return " " .. branch
	end
end

local function setStl(value)
	local newStl = vim.go.statusline .. value
	vim.api.nvim_set_option("statusline", newStl)
end

vim.api.nvim_set_option("statusline", "")
setStl("%#VimMode#")
setStl(" " .. vimModes[vim.fn.mode()]:upper() .. " ")
setStl("%#GitBranch#")
setStl(" " .. gitBranch() .. " ")
setStl("%#StatusLine#")
setStl(" %t ")
setStl("%=")
setStl(" %y ")
setStl("%#ScrollPercentage#")
setStl(" %p%% ")
setStl("%#CursorLoc#")
setStl(" %l:%c ")
