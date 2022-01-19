-- Toggle terminal window settings
vim.cmd[[
" Terminal Highlight
" au TermOpen,TermEnter * setlocal winhl=Normal:Terminal,NormalNC:TerminalNC
" Terminal Settings
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]

-- Identify ".prettierc" file as JSON by default
vim.cmd[[
au BufRead,BufNewFile .prettierrc set ft=json
]]
--
-- Identify ".mdx" files as markdwon by default
vim.cmd[[
au BufReadPost *.md setlocal colorcolumn=80
au BufRead,BufNewFile *.mdx set ft=markdown
]]
