local toggle_term_window = -1
local toggle_term_buffer = -1
local toggle_term_job_id = -1
local toggle_term_window_size = -1

local T = {}

local function termOpen()
	if vim.fn.bufexists(toggle_term_buffer) == 0 then
		vim.cmd("new toggle_term")
		vim.cmd("resize 15")

		toggle_term_job_id = vim.fn.termopen("bash", { detach = 1 })
		vim.cmd("silent file Toggle\\ Terminal")

		toggle_term_window = vim.api.nvim_get_current_win()
		toggle_term_buffer = vim.api.nvim_get_current_buf()

		vim.opt.buflisted = false
	else
		if vim.fn.win_gotoid(toggle_term_window) == 0 then
			vim.cmd("sp")
			-- vimcmd("resize " .. toggle_term_window_size)
			vim.cmd("resize 15")
			vim.cmd("buffer Toggle\\ Terminal")

			toggle_term_window = vim.api.nvim_get_current_win()
		end
	end
end

local function termClose()
	if vim.fn.win_gotoid(toggle_term_window) ~= 0 then
		-- Stores the previous terminal windows size
		toggle_term_window_size = vim.fn.winheight(toggle_term_window)
		vim.cmd("hide")
	end
end

T.termToggle = function()
	if vim.fn.win_gotoid(toggle_term_window) == 0 then
		termOpen()
	else
		termClose()
	end
end

return T