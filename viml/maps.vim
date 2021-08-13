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

" Toggle Terminal
nnoremap <silent> <leader>t <cmd>lua require 'terminal'.termToggle()<CR>

" NvimTree
nnoremap <silent> <leader>e <cmd>NvimTreeToggle<CR>

" Telescope
" Default Actions
nnoremap <silent> <leader>ff <cmd>Telescope find_files hidden=true<CR>
nnoremap <silent> <leader>lg <cmd>Telescope live_grep             <CR>
nnoremap <silent> <leader>gc <cmd>Telescope git_commits           <CR>
" Custom Actions
nnoremap <silent> <leader>nv <cmd>lua require 'plugins.telescope'.search_neovim()  <CR>
nnoremap <silent> <leader>df <cmd>lua require 'plugins.telescope'.search_dotfiles()<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)

