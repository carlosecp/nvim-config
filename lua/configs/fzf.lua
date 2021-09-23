require "fzf-lua".setup {
	fzf_layout = "default",
	border = _G.itscarlosecp.borders,
	previewers = {
		cat =     { hidden = true },
		bat =     { hidden = true },
		builtin = { hidden = true },
	},
	files = {
		git_icons = false,
		file_icons = true
	}
}
