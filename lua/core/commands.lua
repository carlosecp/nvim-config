--[[ Autocommands and Neovim's default
behaviour modifiers
]]

-- Terminal window settings
vim.cmd[[
" Terminal Highlight
au TermOpen,TermEnter * setlocal winhl=Normal:Terminal,NormalNC:TerminalNC
" Terminal Settings
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]

-- Override filetypes for specific files
vim.cmd[[
" Identify .prettierc as standard JSON
au BufRead,BufNewFile .prettierrc set ft=json

" Take .json files as .jsonc
au BufRead,BufNewFile *.json set ft=jsonc
]]
