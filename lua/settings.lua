local o = vim.opt

-- Defaults
o.hidden         = true -- Don't unload buffers when hidden
o.cursorline     = true -- Highlight current line
o.termguicolors  = true -- Enables 24-bit RGB colors in TUI
o.splitbelow     = true -- New split defaults to below position
o.splitright     = true -- New vert split deafult to right position

-- Search
o.hlsearch       = true -- Highlight all matching search results
o.ignorecase     = true -- Case insensitive search

-- Scrolling
o.number         = true   -- Show line numbers to the side
o.relativenumber = true   -- Show numbers relative to the current line
o.scrolloff      = 5      -- Scroll before end of buffer
o.wrap           = false  -- Don't wrap long lines

-- Autocompletion
o.completeopt    = {
  "menu",     -- Use popupmenu to show results
  "menuone",  -- Use the popup even with one result
  "noselect", -- Don't autoselect first entry
	"noinsert"  -- Don't insert until user selects
}
o.pumheight      = 10  -- Maximum results per popup page
o.cmdheight      = 2   -- Height of neovim's command line (in lines)
o.updatetime     = 300 -- Faster autocompletion

-- Indentation
o.expandtab      = false  -- Use spces instead of tabs
o.tabstop        = 2      -- Tab character width
o.shiftwidth     = 2      -- Fallbacks to tabstop
o.autoindent     = true   -- Indent on newline (<CR>)
o.smartindent    = true   -- Smarter indentation
o.smarttab       = true   -- Smarter tab width

-- Format Options
-- Stop adding comments on newline
vim.cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]
