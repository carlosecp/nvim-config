local opt = vim.api.nvim_set_option

local function st(data)
	local section = vim.go.statusline .. data
	opt("statusline", section)
end

vim.cmd[[set statusline+=%{expand('%:~:.')}]]
st("%=")
st("%y")
st("[%l:%c]")
st("[%2p%%]")
