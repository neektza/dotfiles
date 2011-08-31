call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" forget old vim
set nocompatible
set modelines=0

" gvim specific
set winaltkeys=no

colorscheme vividchalk " texmate like

" tab and spaces
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set listchars=tab:▸\ ,eol:¬

" backup
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set nobackup
set nowritebackup
set noswapfile

" TODO: comments
set encoding=utf-8
set scrolloff=10
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
set undofile
set norelativenumber
set number
set foldmethod=manual

" include underscore in word movements
set iskeyword+=_

" wrapping
set nowrap
set linebreak
"set textwidth=79
"set nolinebreak
set formatoptions=qrn1
"set colorcolumn=85

" navigation
"nnoremap ' `
"nnoremap ` '
nnoremap <C-a> ^
nnoremap <C-e> $

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

" educational>
inoremap <Left>  <Left>
inoremap <Right> <Right>
inoremap <Up>    <Up>
inoremap <Down>  <Down>
nnoremap <Left>  <Left>
nnoremap <Right> <Right>
nnoremap <Up>    <Up>
nnoremap <Down>  <Down>
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" leader
let mapleader = ","

" substitute under visual
function! GetVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction
vmap <leader>s :<c-U>%s/<c-r>=GetVisual()<cr>/

" misc leader mappings
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYGVIMRC<cr>
nnoremap <leader>v V`]
"nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" f keys
nmap <F3> :set list!<cr>
nnoremap <F4> :set nolist wrap!<cr>

" fold html tag
nnoremap <leader>ft Vatzf

" window, tab and split screen navigation
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>l
noremap <C-j> <C-w>w
noremap <C-k> <C-w>W
nnoremap <A-k> :tabprev<cr>
nnoremap <A-j> :tabnext<cr>
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

" iMacfiy
nnoremap <A-w> :q<cr>
nnoremap <A-q> :qall<cr>
nnoremap <A-s> :w<cr>
inoremap <A-w> <esc>:q<cr>a
inoremap <A-q> <esc>:qall<cr>a
inoremap <A-s> <esc>:w<cr>a
nnoremap <A-z> u
nnoremap <A-S-z> <C-r>

" ack
nnoremap <leader>a :Ack -i 

" fugitive (git)
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>

" nerdtree
noremap <F1> :NERDTreeToggle<cr>
inoremap <F1> <esc>:NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']
au Filetype nerdtree setlocal nolist

" tasklist
nnoremap <leader>k <Plug>TaskList

" command-t
nnoremap <leader>fl :CommandTFlush<cr>

" go to work directory
"command Store :exec "chdir /media/sandbox/workspace/meteor-prototype-catalog-apis"
"command Catalog :exec "chdir /media/sandbox/workspace/emobile-catalog"

" Toggle fold state between closed and opened.
"
" If there is no fold at current line, just moves forward.
" If it is present, reverse it's state.

fu! ToggleFold()
  if foldlevel('.') == 0
    normal! l
  else
    if foldclosed('.') < 0
      . foldclose
    else
      . foldopen
    endif
  endif
  echo
endf

" Map this function to Space key.
noremap <space> :call ToggleFold()<CR> 


" ctags
map <f9> :!ctags --extra=+f --exclude=.git --exclude=log -R * ~/.rvm/gems/ruby-1.9.2-p290/gems/*<CR><CR>

