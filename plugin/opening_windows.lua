local open_window = function()
	local buffer = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buffer, "bufhidden", "wipe")

	local nvim_width = vim.api.nvim_get_option("columns")
	local nvim_height = vim.api.nvim_get_option("lines")

	local win_width = math.ceil(nvim_width * 0.8 - 4)
	local win_height = math.ceil(nvim_height * 0.8)

	local cursor_row = math.ceil((nvim_height - win_height) / 2 - 1)
	local cursor_col = math.ceil((nvim_width - win_width) / 2)

	local win_config = {
		relative = "win",
		width = win_width,
		height = win_height,
		border = "rounded",
		row = cursor_row,
		col = cursor_col
	}

	vim.api.nvim_open_win(buffer, true, win_config)
end
