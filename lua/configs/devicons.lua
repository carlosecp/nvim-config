-- nvim-web-devicons
-- lua `fork` of vim-web-devicons for neovim
-- https://github.com/kyazdani42/nvim-web-devicons

local devicons = require "nvim-web-devicons"
devicons.setup({
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
		js = {
			icon = "",
			name = "js",
		},
		lock = {
			icon = "",
			name = "lock",
		},
		out = {
			icon = "",
			name = "out",
		},
		["robots.txt"] = {
			icon = "ﮧ",
			name = "robots",
		},
		toml = {
			icon = "",
			name = "toml",
		},
		ts = {
			icon = "ﯤ",
			name = "ts",
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
})
