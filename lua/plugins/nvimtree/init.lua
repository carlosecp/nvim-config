require "nvim-web-devicons"

vim.g.nvim_tree_ignore        = {"node_modules", ".cache", "*.o"}
vim.g.nvim_tree_follow        = 1
vim.g.nvim_tree_tab_open      = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_indent_markers = 1

vim.g.nvim_tree_icons = {
	default = "",
  symlink = "",
  git = {
    unstaged  = "",
    staged    = "",
    unmerged  = "",
    renamed   = "",
    untracked = "",
    deleted   = "",
    ignored   = "◌"
  },
  folder = {
    default      = "",
    open         = "",
    empty        = "",
    empty_open   = "",
    symlink      = "",
    symlink_open = "",
  },
  lsp = {
    hint    = "",
    info    = "",
    warning = "",
    error   = "",
  }
}
