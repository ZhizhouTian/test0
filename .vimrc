set background=dark
set nu

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd        " Show (partial) command in status line.
set showmatch        " Show matching brackets.
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set incsearch        " Incremental search
set hlsearch
set autowrite        " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)
"set foldmethod=indent     " auto fold up

"------------------personal setting------------------"
"------------------personal setting------------------"

au BufWinEnter *.[ch] let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter *.[ch] let w:m2=matchadd('ErrorMsg', '[ \t]\{1,\}$', -1)
"au BufNew *.[ch] let w:m2=matchadd('ErrorMsg', '[\t]\{1,\}[ ]\{1,\}', -1)
"au BufNew *.[ch] let w:m2=matchadd('ErrorMsg', '[ ]\{1,\}[\t]\{1,\}', -1)

set cst
set cindent
set noswapfile

" Source a global configuration file if available
if has("cscope")
  set csprg=/usr/bin/cscope
  if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
  endif
endif

if has("cscope")
  set csprg=/usr/bin/cscope
  if filereadable("./out/cscope.out")
    cscope add ./out/cscope.out
  endif
endif

nmap <F2> :cs f s <C-R>=expand("<cword>")<CR><CR>
nmap <F3> :cs f g <C-R>=expand("<cword>")<CR><CR>
nmap <F4> <C-T>

nmap <C-\>s :cs f s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs f g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs f f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs f c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs f d <C-R>=expand("<cword>")<CR><CR>

nmap <C-J> :n<CR>
nmap <C-K> :N<CR>
