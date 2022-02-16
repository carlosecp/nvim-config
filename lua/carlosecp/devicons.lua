local devicons = require("nvim-web-devicons")
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
