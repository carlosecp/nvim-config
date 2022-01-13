local o = vim.opt

-- Defaults
o.cursorline     = true
o.termguicolors  = true
o.splitbelow     = true
o.splitright     = true
o.swapfile       = false

-- Search
o.incsearch      = true
o.hlsearch       = true
o.ignorecase     = true

-- Lines / Scrolling
o.number         = true
o.relativenumber = true
o.wrap           = false
o.scrolloff      = 5

-- Autocompletion
o.pumheight      = 10
o.cmdheight      = 2

-- Indentation
o.expandtab      = false
o.tabstop        = 2
o.shiftwidth     = 2
o.autoindent     = true
o.smartindent    = true
o.smarttab       = true

-- Env
o.shell = "bash"
vim.g.python3_host_prog = "/usr/sbin/python3"

-- Format Options
-- Stop adding comments on newline
vim.cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Use faster filetype detection
vim.g.do_filetype_lua = 1
