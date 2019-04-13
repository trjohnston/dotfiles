set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable                           " enable syntax highlighting
set encoding=utf-8
set number                              " show line numbers
set ts=4                                " tab = 4 spaces
set autoindent
set expandtab                           " expand tabs into spaces
set shiftwidth=4                        "
set cursorline                          " create horizontal line under cursor
set showmatch                           " show matching [{()}]
set hlsearch                            " highlight matching search terms
set incsearch                           " do incremental searching
set ignorecase                          " make search case-insensitve
let python_highlight_all=1
set cc=80                               " create colored vertical column
colorscheme elflord
set nowrap                              " do not wrap lines
set history=150                         " keep 150 lines of command line history
set list
set listchars=tab:\|\

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>



" Highlight trailing white space, as per http://vim.wikia.com/wiki/VimTip396
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Werror -Wpedantic'
let g:syntastic_cpp_cflags = '-std=c++11 -Wall -Werror -Wpedantic'
let g:synastic_cpp_no_default_include_dirs = 1
let g:synastic_cpp_no_include_search = 1

" NERDTree Settings
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" vim-airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='luna'
