-- nvim-web-devicons
-- lua `fork` of vim-web-devicons for neovim
-- https://github.com/kyazdani42/nvim-web-devicons

local devicons = require "nvim-web-devicons"
devicons.setup({
	override = {
		dockerfile = {
			icon  = "",
			color = "#0087c9",
			name  = "Dockerfile"
		},
		[".dockerignore"] = {
			icon  = "",
			color = "#0087c9",
			name  = "DockerIgnore"
		},
		["go.mod"] = {
			icon  = "",
			color = "#519aba",
			name  = "Gomod"
		}
	}
})
