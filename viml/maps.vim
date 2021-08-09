" Pane Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ`z

" Undo Reset
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Copy to Clipboard
vnoremap <C-c> "*y

" Toggle Terminal
nnoremap <silent> <leader>t <cmd> vs \| term \| i<CR>
tnoremap <silent> <Esc> <C-\><C-n>

" NvimTree
nnoremap <silent> <leader>e <cmd>NvimTreeToggle<CR>

" Telescope
nnoremap <silent> <leader>ff <cmd>lua require 'telescope.builtin'.find_files { hidden = true; previewer = false }<CR>
nnoremap <silent> <leader>lg <cmd>lua require 'telescope.builtin'.live_grep { previewer = false }<CR>
nnoremap <silent> <leader>gs <cmd>lua require 'telescope.builtin'.grep_string { previews = false }<CR>
nnoremap <silent> <leader>nv <cmd>lua require 'plugins.telescope'.search_neovim()<CR>
nnoremap <silent> <leader>df <cmd>lua require 'plugins.telescope'.search_dotfiles()<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)

" Quickfix
