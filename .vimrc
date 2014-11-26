:set guifont=Terminus\ 14
:set ruler
:set guioptions-=T
:set guioptions-=m
:set guioptions-=r
:syntax on
:set backspace=indent,eol,start
:filetype plugin indent on
" Set spelling language.  
set spelllang=ru 
" Toggle spell checking for the current buffer with Ctrl-i 
map  <F7> :setlocal invspell<CR> 
imap  <F7> <C-o>:setlocal invspell<CR>

set keymap=russian-jcuken
set iminsert=0
set imsearch=0
" Toggle layout for the current buffer
function ToggleRu()
    if &iminsert == 0
        set iminsert=1
    else
        set iminsert=0
    endif
endfunction
map <M-space>:call ToggleRu()<CR>
imap  <M-space> <C-o>:call ToggleRu()<CR>
" :colorscheme elflord
let g:solarized_termcolors=256
:colorscheme solarized
set background=dark
