set background=dark
"set nu

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
  set csprg=/usr/local/bin/cscope
  if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
  endif
endif

if has("cscope")
  set csprg=/usr/local/bin/cscope
  if filereadable("./cscope.out")
    cscope add cscope.out
  endif
endif

"nmap <F2> :cs f s <C-R>=expand("<cword>")<CR><CR>"
nmap <F2> :NERDTreeToggle <C-R>=expand("<cword>")<CR><CR>
nmap <F3> :cs f g <C-R>=expand("<cword>")<CR><CR>
nmap <F4> <C-T>

nmap <C-\>s :cs f s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs f g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs f f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs f c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs f d <C-R>=expand("<cword>")<CR><CR>

nmap <C-J> :n<CR>
nmap <C-K> :N<CR>

" Vundle related! "
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'"
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'The-NERD-tree'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

autocmd VimEnter * NERDTree
