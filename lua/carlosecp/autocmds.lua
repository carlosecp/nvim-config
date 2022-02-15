-- Identify ".prettierc" file as JSON by default.
vim.cmd[[
au BufRead,BufNewFile .prettierrc set ft=json
]]

-- Identify ".mdx" files as markdwon by default.
vim.cmd[[
au BufReadPost *.md setlocal colorcolumn=80
au BufRead,BufNewFile *.mdx set ft=markdown
]]
