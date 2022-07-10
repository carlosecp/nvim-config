local status_ok_devicons, devicons = pcall(require, "nvim-web-devicons")

if not status_ok_devicons then return end

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
})
