require "bufferline".setup {
	options = {
		numbers = "none",
		diagnostics = false,
		indicator_icon = " ",
		modified_icon = '●',
    close_icon = '',
		separator_style = {"|", "|"},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center"
			}
		},
		name_formatter = function(buf)
			return vim.fn.fnamemodify(buf.name, "::p:e")
    end,
	}
}

