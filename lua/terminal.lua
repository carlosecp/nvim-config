local terminal_window = -1
local terminal_buffer = -1
local terminal_job_id = -1
local terminal_window_size = -1

local function OpenTerminal()
	print(vim.fn.bufexists(terminal_window))
end
