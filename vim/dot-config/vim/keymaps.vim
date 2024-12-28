" Fix alt key in terminal
" See: https://github.com/vim/vim/issues/2588#issuecomment-697959290
if !has('nvim') && !has('gui_running')
  set ttimeoutlen=5
  " set up Meta to work properly for most keys in terminal vim
  " NOTE: these do not work: <m-space>,<m->>,<m-[>,<m-]>,<m-{up,down,left,right}>
  " NOTE: <m-@>,<m-O> only work in xterm and gvim - not st, urxvt, etc
  " NOTE: map <m-\|> or <m-bar>
  for ord in range(33,61)+range(63,90)+range(92,126)
    let char = ord is 34 ? '\"' : ord is 124 ? '\|' : nr2char(ord)
    exec printf("set <m-%s>=\<esc>%s", char, char)
    if exists(':tnoremap') " fix terminal control sequences
      exec printf("tnoremap <silent> <m-%s> <esc>%s", char, char)
    endif
  endfor
  " set up <c-left> and <c-right> properly
  " NOTE: if below don't work, compare with ctrl-v + CTRL-{LEFT,RIGHT} in INSERT mode
  " NOTE: <c-up>,<c-down> do not work in any terminal
  exe "set <c-right>=\<esc>[1;5C"
  exe "set <c-left>=\<esc>[1;5D"
endif

" Plugins
imap <C-j> <Plug>snipMateNextOrTrigger
smap <C-j> <Plug>snipMateNextOrTrigger

" Handy cursor moving in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>

" Command mode key mappings
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" exiting which is Ctrl-C
" See: https://vi.stackexchange.com/questions/16963/remap-esc-key-in-vim
cnoremap <C-g> <C-c>
cnoremap <M-e> <C-f>
cnoremap <C-d> <Delete>

" Alt+h/l to switch buffers
nnoremap <silent><M-h> :bprevious<cr>
nnoremap <silent><M-l> :bnext<cr>

" Map the hard to get ^ and $
nnoremap _ ^
nnoremap + $
inoremap <C-a> <Home>
inoremap <C-e> <End>
onoremap <C-a> ^
onoremap <C-e> $

" Intuitive visual mode indent
vnoremap < <gv
vnoremap > >gv

" Use Ctrl-S to save current buffer
nnoremap <C-s> :w<CR>

" Zoom current window to maximum size
nnoremap <silent> <C-w>z <C-w>_ \| <C-w>\|

" Open file explorer (vertical-split, left, full-screen)
" Enable line number in file explorer (number relativenumber)
" Tree style file list
" Disable banner
" Netrw width 25%
"nnoremap <C-e> :Vex<CR>
nnoremap <space>e :Lex<CR>
nnoremap <space>E :E<CR>
let g:netrw_bufsettings = 'noma nomod nonu nowrap ro nobl number relativenumber'
let g:netrw_liststyle = 3
"let g:netrw_banner = 0
let g:netrw_winsize = 25

" Align equals
" Dot't use this command to align multiple lines with different number of equals at the same time.
"command! -range Aleq execute <line1>.",".<line2> . "! sed 's/=/PXXXQYYY/'| column -t -s 'PXXX'| sed 's/QYYY\s*/= /'"
command! -range Aleq execute <line1>.",".<line2> . "! column -t -s= -o="
nnoremap <silent> <C-q> :Aleq<CR>
command! -range Align let delimiter = input("Input delimiter: ") |
            \   execute <line1>.",".<line2> . "! column -t '-s" . delimiter . "' '-o" . delimiter . "'"

" Make `*` stay at the current cursor position.
"nnoremap * m`:keepjumps normal! *``<cr>

" Change current word(like ciw), but repeatable with dot `.` for the same next word.
nnoremap <silent> c<Tab> :let @/=expand('<cword>')<cr>cgn

" Quick lookup current word in dictionary
nnoremap <space>d :!ydcv <cword><CR>

" Use tab and shift-tab to navigate in completions.
" Use enter to comfirm current completion candidate.
" Use esc to close the completion popup.
inoremap <silent><expr> <TAB> pumvisible() ? "<C-n>" : "<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "<C-p>" : "<S-TAB>"
inoremap <silent><expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
inoremap <silent><expr> <ESC> pumvisible() ? "<C-e>" : "<ESC>"

" Use syntax completion in omnifunc completion for files without a default omnifunc
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
                \		setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
endif

" Insert output of external commands into **current** cursor position.
" :r !{cmd} insert into next line
function InlineCommand()
    let l:cmd = input('Command: ')
    let l:output = system(l:cmd)
    let l:output = substitute(l:output, '[\r\n]*$', '', '')
    execute 'normal i' . l:output
endfunction

nmap <silent> <leader>e :call InlineCommand()<CR>

" Ctrl-C to call shellcheck
autocmd FileType sh nnoremap <C-c> :!shellcheck %:p<CR>

" make and quickfix navigation
function! SetMakeprg()
    let l:makeprg = input("makeprg: ", "make", "arglist")
    let &makeprg = l:makeprg
endfunction
nnoremap <leader>m :make
nnoremap <leader>cm :call SetMakeprg()<CR>
autocmd FileType c nnoremap <leader>cc :set makeprg=cc\ -Wall\ -Wextra \| make %<CR>
nnoremap [g :cprevious<CR>
nnoremap ]g :cnext<CR>

