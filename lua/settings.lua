-- Globals
vim.cmd("syntax enable")
vim.opt.hidden     = true
vim.opt.wrap       = false
vim.opt.ignorecase = true

-- Autocompletion
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight   = 10
vim.opt.cmdheight   = 2
vim.opt.updatetime  = 300

-- Indentation
vim.opt.tabstop    = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab  = false -- Tabs: false, Spaces: true
vim.opt.autoindent = true

-- Editing
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 5
vim.opt.cursorline     = true
vim.cmd("set iskeyword+=-")

-- Interface
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.termguicolors = true

