-- Identify ".prettierc" file as JSON type by default
vim.cmd[[
au BufRead,BufNewFile .prettierrc set ft=json
]]
