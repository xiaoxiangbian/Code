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
NeoBundle 'vim-scripts/a.vim'
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
let Tlist_Exit_OnlyWindow      = 2             " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Left_Window      = 1             " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close = 1             " 自动折叠
let Tlist_Sort_Type = 'name'                   " items in tags sorted by name
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"let Tlist_Auto_Open=1                         " open taglist default
let Tlist_Show_Menu=1                          "显示taglist菜单
let Tlist_Process_File_Always=1                "实时更新tags


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"CTags
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"生成一个tags文件
nmap <F9> <Esc>:!ctags -R *<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"WinManager
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"定义打开关闭winmanager按键
nmap <silent> <F8> :WMToggle<cr>              
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l
"nmap <silent> <TAB> <C-w>w


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"NeoComplete
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <TAB> <C-n>
if neo_bundle_enabled == 1
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=tern#Complete
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    " Neosnippet
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "            \ '\<Plug>(neosnippet_expand_or_jump)'
    "            \: pumvisible() ? '\<C-n>' : '\<TAB>'
    "smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "            \ '\<Plug>(neosnippet_expand_or_jump)'
    "            \: '\<TAB>'

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif
endif
