local background_h_group = {
	guibg = {
		attribute = "bg",
		highlight = "StatusLine"
	}
}

require "bufferline".setup {
	options = {
		offsets = {
			{
				filetype   = "NvimTree",
				text       = "File Explorer",
				highlight  = "NvimTreeNormal",
				text_align = "center"
			}
		},
		show_close_icon = false
	},
	highlights = {
		fill = background_h_group,
		background = background_h_group,
		close_button = background_h_group,
		separator = background_h_group
	}
}

