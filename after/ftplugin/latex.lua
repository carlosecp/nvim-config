vim.cmd [[
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1 | redraw!"
]]
