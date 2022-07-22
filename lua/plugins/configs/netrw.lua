-- READ: https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- vim.g.netrw_keepj = ""
vim.g.netrw_altfile   = 1
vim.g.netrw_hide      = 0
vim.g.netrw_liststyle = 3

require("core.mappings").netrw()
