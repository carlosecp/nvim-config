require "nvim-web-devicons"

vim.g.nvim_tree_ignore         = {"node_modules", ".cache", "*.o"}
vim.g.nvim_tree_follow         = 1
vim.g.nvim_tree_tab_open       = 1
vim.g.nvim_tree_special_files  = {}
vim.g.nvim_tree_indent_markers = 0

vim.g.nvim_tree_icons = {
	default = "",
  symlink = "",
  git = {
    unstaged  = "●",
    staged    = "●",
    unmerged  = "●",
    renamed   = "●",
    untracked = "●",
    deleted   = "●",
    ignored   = "○"
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
    hint    = "",
    info    = "",
    warning = "",
    error   = "",
  }
}

local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {
	{ key = "<CR>",    cb = tree_cb "edit" },
	{ key = "<C-v>",   cb = tree_cb "vsplit" },
	{ key = "<C-x>",   cb = tree_cb "split" },
	{ key = "<C-t>",   cb = tree_cb "tabnew" },
	{ key = "I",       cb = tree_cb "toggle_ignored" },
	{ key = "H",       cb = tree_cb "toggle_dotfiles" },
	{ key = "R",       cb = tree_cb "refresh" },
	{ key = "a",       cb = tree_cb "create" },
	{ key = "d",       cb = tree_cb "remove" },
	{ key = "r",       cb = tree_cb "rename" },
	{ key = "<C-r>",   cb = tree_cb "full_rename" },
	{ key = "x",       cb = tree_cb "cut" },
	{ key = "y",       cb = tree_cb "copy" },
	{ key = "p",       cb = tree_cb "paste" },
	{ key = "Y",       cb = tree_cb "copy_name" },
	{ key = "<C-y>",   cb = tree_cb "copy_path" },
	{ key = "<C-S-y>", cb = tree_cb "copy_absolute_path" },
	{ key = "q",       cb = tree_cb "close" },
	{ key = "?",      cb = tree_cb "toggle_help" },
}
