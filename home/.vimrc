" Need to call on initially to support git
filetype on
filetype off

" forget old vim
set nocompatible
set modelines=0

" Plugin manager installation
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'benmills/vimux'
Plug 'edkolev/tmuxline.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim'
Plug 'bruno-/vim-husk'
Plug 'tmux-plugins/vim-tmux'
Plug 'flazz/vim-colorschemes'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/YankRing.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'gkz/vim-ls'
Plug 'rking/ag.vim'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'vim-ruby/vim-ruby'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'chriseppstein/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'juvenn/mustache.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'stephpy/vim-yaml'
Plug 'jonstoler/werewolf.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-static'
Plug 'rizzatti/dash.vim'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

filetype plugin indent on

syntax on

" vim/macvim 
if has("gui_running")
	" settings
	set guioptions=egmrt
	set winaltkeys=no
	set macmeta
	set transparency=0
	set nobeval
	set listchars=tab:>\ ,eol:¬
	set guifont=Liberation\ Mono\ for\ Powerline:h14
	" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
	" set guifont=Inconsolata\ for\ Powerline:h15
	" set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h14
else
	set clipboard=unnamed
endif

" colors
set t_Co=256
:if $LIGHT
	:set background=light
	:colorscheme pyte
:else
	:set background=dark
	:colorscheme freya
:end

" tab and spaces
set nosmarttab
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ffs=unix,dos

" capistrano is Ruby
autocmd BufRead,BufNewFile *.cap set filetype=ruby
autocmd BufRead,BufNewFile Capfile set filetype=ruby

" Ruby is spaces, not tabs
autocmd Filetype ruby setlocal et ts=2 sts=2 sw=2

" backup
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set nobackup
set nowritebackup
set noswapfile

" comments
set encoding=utf-8
set scrolloff=10
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set nocursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set norelativenumber
set number
set foldmethod=manual
set mouse=a

" include underscore in word movements
set iskeyword+=_

" wrapping
set nowrap
set linebreak
"set textwidth=79
"set nolinebreak
set formatoptions=qrn1
"set colorcolumn=85

" leader
let mapleader = "\<Space>"

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
nnoremap <leader>, :noh<cr>

" window, tab and split screen navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>_ :split<cr>
nnoremap <leader>\| :vsplit<cr>
nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt

" misc leader mappings
nnoremap <leader>ev :e $MYVIMRC<cr>

" EOL chars
nmap <F3> :set list!<cr>
nnoremap <F4> :set nolist wrap!<cr>

" Trailing whitespace removal
map <f8> :%s/\s\+$//<cr>

" silver surfer searcher
nnoremap <leader>a :Ag -i 

" fugitive (git)
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>

" nerdtree
map <F1> :NERDTreeToggle \| :silent NERDTreeMirror<cr>
inoremap <F1> <esc>:NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$']
au Filetype nerdtree setlocal nolist

" tagbar 
map <F2> :TagbarToggle<cr>
let g:tagbar_autofocus=1

" ctrlp
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_custom_ignore = { 'dir': 'node_modules\|bower_components\|DS_Store\|git' }
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <f5> :CtrlPClearCache<cr>
set wildignore+=*/target/*,*/_build/*,*/tmp/*,*.so,*.swp,*.zip,*.log,.DS_Store

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

" Various shortcuts for fugitive
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>

" Other shortcuts
inoremap jj <Esc>l
inoremap kk <Esc>l

" up/down through wraps
nnoremap j gj
nnoremap k gk

" folding
nnoremap z<space> za
xnoremap z<space> za

" lambda shadowing, h4x0r
" if has('conceal')
" 	if has('autocmd')
" 		autocmd Syntax * syn keyword Operator not conceal cchar=¬
" 		autocmd Syntax * syn keyword Operator lambda conceal cchar=λ
" 		autocmd Syntax ruby syn match rubyKeyword "->" conceal cchar=λ
" 		autocmd Syntax haskell syn match hsKeyword "\\" conceal cchar=λ
" 	endif
" 	hi! link Conceal Operator
" 	set conceallevel=2
" endif

" spellchecking
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md set complete+=kspell
autocmd FileType gitcommit setlocal spell spelllang=en_us

" rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-test
nmap <silent> <leader>rn :TestNearest<cr>
nmap <silent> <leader>rf :TestFile<cr>
nmap <silent> <leader>rs :TestSuite<cr>
nmap <silent> <leader>rl :TestLast<cr>
nmap <silent> <leader>rv :TestVisit<cr>

" syntastic
" let g:syntastic_check_on_save=1
" let g:syntastic_ruby_checkers=["mri", "rubocop"]

" dash search
:nmap <silent> <leader>d <Plug>DashSearch

" emacs-like navigation
nnoremap <C-a> ^
nnoremap <C-e> $

" airline
let g:airline_powerline_fonts = 1

" Markdown, disable folding
let g:vim_markdown_folding_disabled=1

" force old regex engine
set re=1

" word swapping
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

:nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
:nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
