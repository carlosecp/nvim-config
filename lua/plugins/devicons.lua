local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then return end

devicons.setup {
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
}
