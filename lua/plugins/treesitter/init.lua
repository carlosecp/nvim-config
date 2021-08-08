require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	indent = { enable = false },
	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-i>",
      node_incremental = "<C-i>",
      scope_incremental = "<C-u>",
      node_decremental = "<C-m>",
    }
  },
	autotag = { enable = true }
}

