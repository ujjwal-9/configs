set ruler
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" highlight Comment ctermfg=green

" Enable system clipboard support
set clipboard=unnamedplus

" Map Command + C to copy selected text to system clipboard
vnoremap <C-c> "*y

" Map Command + V to paste from system clipboard
nnoremap <C-v> "*p
inoremap <C-v> <C-R>*
cnoremap <C-v> <C-R>*

" Optional: Map Command + X to cut selected text
vnoremap <C-x> "+d


call plug#begin()

Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'

call plug#end()


map <C-n> :NERDTreeToggle<CR>
