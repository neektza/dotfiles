call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" forget old vim
set nocompatible
set modelines=0

" tab is 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab

" backup
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

" TODO: comments
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" wrapping
set wrap
"set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" search/move
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault "/g is default
set incsearch
set showmatch
set hlsearch
"nnoremap <tab> %
"vnoremap <tab> %

" educational
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" leader
let mapleader = ","

" leader mappings
nnoremap <leader><space> :noh<cr>

" fold html tag
nnoremap <leader>ft Vatzf

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ack
nnoremap <leader>a :Ack

" nerdtree
noremap <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']
au Filetype nerdtree setlocal nolist

" ignore f1 key
noremap <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>
