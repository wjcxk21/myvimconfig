" 不使用vi的键盘模式，只使用vim自己的
set nocompatible              " be iMproved, required
syntax on
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'git@github.com:vim-scripts/a.vim.git'
Plugin 'git@github.com:vim-scripts/DoxygenToolkit.vim.git'
Plugin 'git@github.com:vim-scripts/OmniCppComplete.git'
Plugin 'git@github.com:vim-scripts/taglist.vim.git'
Plugin 'git@github.com:vim-scripts/The-NERD-Commenter.git'
Plugin 'git@github.com:vim-scripts/The-NERD-tree.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'pythoncomplete'
Plugin 'molokai'
Plugin 'vimcdoc'
Plugin 'git@github.com:vim-scripts/Tagbar.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" 侦测文件类型
filetype on
" 为特定文件类型载入相关缩进文件
filetype indent on    " required
" To ignore plugin indent changes, instead use:
" 载入文件类型插件
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader='\'
set helplang=ch

" Switch syntax highlighting on, when the terminal has colors
" if (t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"  syntax on
" endif

" Javascript syntax hightlight
syntax enable

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery

" Color scheme
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,gb18030,gbk,big5,usc-bom,euc-jp,gb2312,cp936

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
" set list listchars=tab:»·,trail:·
set list listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" Make it obvious where 80 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
set number
set numberwidth=5
"
set matchpairs+=<:>
set hlsearch

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"" NerdTree
let NERDChristmasTree=0
let NERDTreeWinSize=32
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>


" Tagbar
let g:tagbar_width=32
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>


set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness
