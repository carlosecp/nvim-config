local toggle_term_window = -1
local toggle_term_buffer = -1

local terminal = {}
local toggle_term_window_size = 12

local term_open = function(split_dir)
	-- If terminal buffer does not exists
	if vim.fn.bufexists(toggle_term_buffer) == 0 then
		vim.cmd("new toggle_term") -- use just `new` to :split terminal

		vim.cmd("resize " .. toggle_term_window_size)
		vim.fn.termopen("fish", { detach = 1 })
		vim.cmd("silent file Terminal")

		toggle_term_window = vim.api.nvim_get_current_win()
		toggle_term_buffer = vim.api.nvim_get_current_buf()

		vim.opt.buflisted = false
	else
		if vim.fn.win_gotoid(toggle_term_window) == 0 then
			vim.cmd("sp")
			vim.cmd("buffer Terminal")
			vim.cmd("resize " .. toggle_term_window_size)

			toggle_term_window = vim.api.nvim_get_current_win()
		end
	end
end

local term_close = function()
	if vim.fn.win_gotoid(toggle_term_window) ~= 0 then
		-- Stores the previous terminal windows size
		toggle_term_window_size = vim.fn.winheight(toggle_term_window)
		vim.cmd("hide")
	end
end

terminal.term_toggle = function(split_dir)
	if vim.fn.win_gotoid(toggle_term_window) == 0 then
		term_open(split_dir)
	else
		term_close()
	end
end

-- Activates keybindings
require("core.bindings").toggle_terminal()

return terminal
