-- nvim-web-devicons
-- lua `fork` of vim-web-devicons for neovim
-- https://github.com/kyazdani42/nvim-web-devicons

local devicons = require "nvim-web-devicons"
devicons.setup {
	override = {
		css = {
			icon = "",
			name = "css",
		},
		Dockerfile = {
			icon = "",
			name = "Dockerfile",
		},
		html = {
			icon = "",
			name = "html",
		},
		lock = {
			icon = "",
			name = "lock",
		},
		["robots.txt"] = {
			icon = "ﮧ",
			name = "robots",
		},
		toml = {
			icon = "",
			name = "toml",
		},
		vue = {
			icon = "﵂",
			name = "vue",
		},
		xz = {
			icon = "",
			name = "xz",
		},
		zip = {
			icon = "",
			name = "zip",
		}
	}
}
