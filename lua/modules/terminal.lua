local toggle_term_window = -1
local toggle_term_buffer = -1

local T = {}

local function termOpen()
	-- If terminal buffer does not exists
	if vim.fn.bufexists(toggle_term_buffer) == 0 then
		vim.cmd("vnew toggle_term") -- use just `new` to :split terminal
		-- vim.cmd("resize " .. term_size)
		vim.fn.termopen("fish", { detach = 1 })
		vim.cmd("silent file Terminal")

		toggle_term_window = vim.api.nvim_get_current_win()
		toggle_term_buffer = vim.api.nvim_get_current_buf()

		vim.opt.buflisted = false
	else
		if vim.fn.win_gotoid(toggle_term_window) == 0 then
			vim.cmd("vs")
			vim.cmd("buffer Terminal")

			toggle_term_window = vim.api.nvim_get_current_win()
		end
	end
end

local function termClose()
	if vim.fn.win_gotoid(toggle_term_window) ~= 0 then
		-- Stores the previous terminal windows size
		-- toggle_term_window_size = vim.fn.winheight(toggle_term_window)
		vim.cmd("hide")
	end
end

function T.termToggle()
	if vim.fn.win_gotoid(toggle_term_window) == 0 then
		termOpen()
	else
		termClose()
	end
end

-- Activates keymappings
require "core.mappings".terminal()

return T
