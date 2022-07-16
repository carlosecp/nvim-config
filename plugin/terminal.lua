local utils = require("core.utils")
local map = utils.map

local toggle_term_window = -1
local toggle_term_buffer = -1
local toggle_term_window_size = 12

local function term_open()
	-- If terminal buffer does not exists
	if vim.fn.bufexists(toggle_term_buffer) == 0 then
		vim.cmd("new toggle_term")

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

local function term_close()
	if vim.fn.win_gotoid(toggle_term_window) ~= 0 then
		-- Stores the previous terminal windows size
		toggle_term_window_size = vim.fn.winheight(toggle_term_window)
		vim.cmd("hide")
	end
end

local function term_toggle()
	if vim.fn.win_gotoid(toggle_term_window) == 0 then
		term_open()
	else
		term_close()
	end
end

-- TODO: I can use Lua autocommands now.
-- Toggle terminal window settings
vim.cmd[[
" Terminal Highlight
au TermOpen,TermEnter * setlocal winhl=Normal:Terminal,NormalNC:TerminalNC

" Terminal Settings
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]

map("n", "<C-t>", term_toggle)
map("t", "<C-t>", term_toggle)
