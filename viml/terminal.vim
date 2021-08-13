let s:_terminal_window = -1
let s:_terminal_buffer = -1
let s:_terminal_job_id = -1
let s:_terminal_window_size = -1

function! TerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:_terminal_buffer)
    " Creates a window call _terminal
    new _terminal
    " Moves the window to the bottom
    " wincmd J
    resize 15
    let s:_terminal_job_id = termopen($SHELL, { 'detach': 1 })

     " Change the name of the buffer to "Terminal 1"
     silent file Terminal\ 1
     " Gets the id of the terminal window
     let s:_terminal_window = win_getid()
     let s:_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:_terminal_window)
    sp
    " Moves to the window below the current one
    wincmd J   
    execute "resize " . s:_terminal_window_size 
    buffer Terminal\ 1
     " Gets the id of the terminal window
     let s:_terminal_window = win_getid()
    endif
  endif
endfunction

function! TerminalToggle()
  if win_gotoid(s:_terminal_window)
    call TerminalClose()
  else
    call TerminalOpen()
  endif
endfunction

function! TerminalClose()
  if win_gotoid(s:_terminal_window)
    let s:_terminal_window_size = winheight(s:_terminal_window) 
    " close the current window
    hide
  endif
endfunction

function! TerminalExec(cmd)
  if !win_gotoid(s:_terminal_window)
    call TerminalOpen()
  endif

  " clear current input
  call jobsend(s:_terminal_job_id, "clear\n")

  " run cmd
  call jobsend(s:_terminal_job_id, a:cmd . "\n")
  normal! G
  wincmd p
endfunction

" With this maps you can now toggle the terminal
nnoremap <leader>t :call TerminalToggle()<cr>
tnoremap <F7> <C-\><C-n>:call TerminalToggle()<cr>
nnoremap <M-CR> :call TerminalToggle()<cr>
tnoremap <M-CR> <C-\><C-n>:call TerminalToggle()<cr>
