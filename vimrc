set langmenu=none         " force to use the English menus
set nocompatible          " be iMproved
filetype off              " required!

" Setting up NeoBundle - the vim plugin bundler
let neo_bundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neo_bundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
endif

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!


" Add your bundles here
" libraries

" color schemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'zeis/vim-kolor'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'summerfruit256.vim'
NeoBundle 'industry.vim'

" view
NeoBundle 'bling/vim-airline'
NeoBundle 'winmanager'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"function
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'kien/ctrlp.vim'
""NeoBundle 'AutoClose'
let neo_bundle_enabled=0
if has('lua')
    NeoBundle 'Shougo/neocomplete.vim'
    let neo_bundle_enabled=1
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Setting up NeoBundle - the vim plugin bundler end

""
"" Basic Setup
""

set number            " Show line numbers
"set relativenumber   " Show relative line numbers
set ruler             " Show line and column number
set laststatus=2      " Always show the status bar
syntax enable         " Turn on syntax highlighting allowing local overrides
let mapleader = ","
set fileencodings=ucs-bom,utf-8,cp936
set encoding=utf-8    " Set default encoding to UTF-8

""
"" View settings
""
" set background=dark
if has('gui_running')
	set guifont=Inconsolata\ Awesome:h13
        colorscheme Tomorrow-Night-Blue
else
    colorscheme hybrid
endif

set noshowmode          " otherwise messages shown at the bottom line
			" won't be seen in some modes.
set scrolloff=5
set guioptions-=T       "Hide toolbar
set guioptions-=r       "Hide right vertical scroll bar
set guioptions-=L       "Hide left vertical scroll bar
set guioptions-=e       "Use non-GUI tabline

""
"" Editing Settings
""

set autoindent
set smartindent

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:▸\               " a tab should display as "  "
" set listchars+=trail:•            " show trailing spaces as dots
set listchars+=extends:▶          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:◀         " The character to show in the last column when wrap is
" off and the line continues beyond the left of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"Taglist
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TagList
"打开Taglist/TxtBrowser窗口，在右侧栏显示
nmap <leader>tl :Tlist<CR><c-l>
" :Tlist              调用TagList
let Tlist_Show_One_File        = 1             " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow      = 1             " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Left_Window      = 1             " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close = 1             " 自动折叠
let Tlist_Sort_Type = 'name'                   " items in tags sorted by name
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"let Tlist_Auto_Open=1                          " open taglist default
let Tlist_Show_Menu=1                          "显示taglist菜单
      

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"WinManager
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoOpenWinManager       = 1             "Always Show WinManager

"设置界面分割
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWidth = 30                     "设置winmanager的宽度，默认为30

"定义打开关闭winmanager按键
nmap <silent> <F8> :WMToggle<cr>              

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"CTags
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"生成一个tags文件
nmap <F9> <Esc>:!ctags -R *<CR>

