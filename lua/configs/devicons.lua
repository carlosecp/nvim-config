-- Redefining some icons
require "nvim-web-devicons".setup {
	override = {
		[".env.local"] = {
			icon  = "",
			color = "#fbc02d",
			name  = "EnvLocal"
		},
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
		js = {
			icon  = "",
			color = "#efd81d",
			name  = "Javascript"
		},
		ts = {
			icon  = "ﯤ",
			color = "#2f74c0",
			name  = "Typescript"
		},
		[".prettierrc"] = {
			icon  = "",
			color = "#56b3b4",
			name  = "PrettierRC"
		},
		[".prettierignore"] = {
			icon  = "",
			color = "#56b3b4",
			name  = "PrettierIgnore"
		},
		["postcss.config.js"] = {
			icon  = "喝",
			color = "#d53733",
			name  = "PostCSSConfig"
		},
		["tailwind.config.js"] = {
			icon  = "﯑",
			color = "#06b6d4",
			name  = "TailwindConfig"
		},
		["test.js"] = {
			icon  = "ﭧ",
			color = "#efd81d",
			name  = "JavascriptTest"
		},
		["test.ts"] = {
			icon  = "ﭧ",
			color = "#2f74c0",
			name  = "TypescriptTest"
		},
		["yarn.lock"] = {
			icon  = "",
			color = "#0288d1",
			name  = "YarnLock"
		},
		scm = {
			icon  = "ﬦ",
			color = "#3c58a4",
			name  = "Scheme"
		}
	}
}
