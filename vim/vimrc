call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" forget old vim
set nocompatible
set modelines=0

" apperance
if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme peaksea
  set nonu
else
  colorscheme zellner
  set background=dark

  set nonu
endif

" tab and spaces
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set listchars=tab:▸\ ,eol:¬
nmap <F1> :set list!<cr>


" backup
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set nobackup
set nowritebackup
set noswapfile

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
set nowrap
"set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" navigation
"nnoremap ' `
"nnoremap ` '

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
nnoremap <leader><space> :noh<cr>

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

" misc leader mappings
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYGVIMRC<cr>
nnoremap <leader>wr :set wrap!<cr>

" fold html tag
nnoremap <leader>ft Vatzf

" window, tab and split screen navigation
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <A-h> :tabprev<cr>
nnoremap <A-l> :tabnext<cr>
nnoremap <leader>n :tabnew<cr>
nnoremap <leader>q :q<cr>
nnoremap <A-1> 1gt
nnoremap <a-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10g

" ack
nnoremap <leader>a :Ack

" fugitive (git)
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>

" nerdtree
noremap <F2> :NERDTreeToggle<cr>
noremap <F3> :NERDTreeFind<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>
inoremap <F3> <esc>:NERDTreeFind<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']
au Filetype nerdtree setlocal nolist
noremap <F1> <ESC>:set invfullscreen<CR>
