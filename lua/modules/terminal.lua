local toggle_term_window = -1
local toggle_term_buffer = -1

local T = {}

local function termOpen(split_dir)
	-- If terminal buffer does not exists
	if vim.fn.bufexists(toggle_term_buffer) == 0 then
		if split_dir == "vertical" then
			vim.cmd("vnew toggle_term") -- use just `new` to :split terminal
		else
			vim.cmd("new toggle_term")
		end
		-- vim.cmd("resize " .. term_size)
		vim.fn.termopen("fish", { detach = 1 })
		vim.cmd("silent file Terminal")

		toggle_term_window = vim.api.nvim_get_current_win()
		toggle_term_buffer = vim.api.nvim_get_current_buf()

		vim.opt.buflisted = false
	else
		if vim.fn.win_gotoid(toggle_term_window) == 0 then
			if split_dir == "vertical" then
				vim.cmd("vs")
			else
				vim.cmd("sp")
			end
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

function T.termToggle(split_dir)
	if vim.fn.win_gotoid(toggle_term_window) == 0 then
		termOpen(split_dir)
	else
		termClose()
	end
end

-- Activates keymappings
require "core.mappings".terminal()

return T
