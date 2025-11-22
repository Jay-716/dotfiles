" Use builtin status line.
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction
"set t_Co=256
set termguicolors
hi User1 guifg=#ffdad8 guibg=#880c0e                     "ctermfg=15 ctermbg=1
hi User2 guifg=#000000 guibg=#F4905C                     "ctermfg=black ctermbg=166
hi User3 guifg=#292b00 guibg=#f4f597                     "ctermfg=black ctermbg=191
hi User4 guifg=#112605 guibg=#aefe7B                     "ctermfg=black ctermbg=10
hi User5 guifg=#051d00 guibg=#7dcc7d                     "ctermfg=black ctermbg=2
hi User7 guifg=#ffffff guibg=#880c0e gui=bold term=bold  "ctermfg=15 ctermbg=1
hi User8 guifg=#ffffff guibg=#5b7fbb                     "ctermfg=white ctermbg=32
hi User9 guifg=#ffffff guibg=#810085                     "ctermfg=white ctermbg=89
hi User0 guifg=#ffffff guibg=#094afe                     "ctermfg=white ctermbg=194
set laststatus=2
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%f\                                "Filename
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%p%%)\               "Rownumber/total (%)
set statusline+=%9*\ col:%c\                              "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

set list
set lcs-=eol:$

augroup HighlightTrailingSpace
    autocmd!

    set lcs+=trail:·
    highlight TrailingSpace ctermbg=red ctermfg=yellow guibg=red guifg=yellow
    autocmd WinEnter,BufEnter * let w:trailing_space_match_id = matchadd('TrailingSpace', '\s\+$')
augroup END

augroup PythonSettings
    autocmd!

    " Display python indent "    " as "|   "
    function! s:SetupPythonHighlight()
        setlocal lcs+=leadmultispace:\|\ \ \ 
        highlight PyIndent ctermfg=gray guifg=gray
        let w:python_indent_match_id = matchadd('PyIndent', '^\(    \)\+', 10)
    endfunction
    autocmd FileType python call s:SetupPythonHighlight()
augroup END

