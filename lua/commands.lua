--[[ Autocommands and Neovim's default
behaviour modifiers
]]

-- Change settings and hgroup for terminal window
vim.cmd[[
" Terminal Highlight
au TermOpen,TermEnter * setlocal winhl=Normal:Terminal,NormalNC:TerminalNC

" Terminal Settings
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]

