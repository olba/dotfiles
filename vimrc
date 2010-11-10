if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
   autocmd BufWritePre *.py,*.js,*.html,*.sh,*.pl :call <SID>StripTrailingWhitespaces()
endif
set nocompatible
set ruler
set showmatch
set shiftwidth=3
set tabstop=3
nmap :Q :q!
nmap :Wq :wq
nmap :q :q!
set noai
set expandtab
syn on
colorscheme darkblue
set background=dark 

set wrap linebreak nolist
set nonumber

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

