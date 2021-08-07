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

" Plugins
nnoremap <silent> <leader>e <cmd>NvimTreeToggle<CR>
nnoremap <silent> <leader>ff <cmd>Telescope find_files hidden=true<CR>
nnoremap <silent> <C-t> <cmd>lua require 'FTerm'.toggle()<CR>
tnoremap <silent> <C-t> <cmd>lua require 'FTerm'.toggle()<CR>

" Telescope
nnoremap <silent> <leader>nv <cmd>lua require 'modules.telescope'.search_neovim()<CR>
nnoremap <silent> <leader>df <cmd>lua require 'modules.telescope'.search_dotfiles()<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)

