" Plugins
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

"inoremap <c-j> <down>
"inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

" Command mode key mappings
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" ALT+N to switch tab
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>

" Map the hard to get ^ and $
nnoremap _ ^
nnoremap + $
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
onoremap <C-a> ^
onoremap <C-e> $

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
nnoremap <leader>mm :make
nnoremap <leader>mc :call SetMakeprg()<CR>
autocmd FileType c nnoremap <leader>cc :set makeprg=cc\ -Wall\ -Wextra \| make %<CR>
nnoremap [g :cprevious<CR>
nnoremap ]g :cnext<CR>

