require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	indent = {
		enable = true,
		disable = {"c", "cpp"}
	},
	autotag = {
		enable = true
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	}
}

