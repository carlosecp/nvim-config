vim.g.coc_global_extensions = {
	-- Language Servers
	"coc-sh",
	"coc-clangd",
	"coc-go",
	"coc-html",
	"coc-tsserver",
	"coc-json",
	"coc-lua",
	"coc-pyright",
	"coc-vimlsp",
	"coc-emmet",
}

vim.cmd[[
" Keymappings 
" Autocompletion
inoremap <silent> <expr> <C-space> coc#refresh()

" LSP
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Actions
nnoremap <silent> <leader>rn <Plug>(coc-rename)
]]

