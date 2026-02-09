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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/yankring.vim'
Plug 'tpope/vim-commentary'
Plug 'slashmili/alchemist.vim'

" Language server support
" Plug 'w0rp/ale'
	
" Langs
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
" Plug 'rust-lang/rust.vim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'pangloss/vim-javascript'
" Plug 'vim-scripts/nginx.vim'
" Plug 'stephpy/vim-yaml'
" Plug 'groenewege/vim-less'
" Plug 'plasticboy/vim-markdown'
" Plug 'chriseppstein/vim-haml'
" Plug 'guns/vim-clojure-static'
Plug 'hashivim/vim-terraform'

Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

" tagbar
" Plug 'majutsushi/tagbar'

" tmux
" Plug 'benmills/vimux'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'edkolev/tmuxline.vim'
" Plug 'bruno-/vim-husk'
" Plug 'tmux-plugins/vim-tmux'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

call plug#end()

filetype plugin indent on

syntax on

" vim/gvim/macvim
if has("gui_running")
	" settings
	set guioptions=egrt
	set winaltkeys=no
	set nobeval
	set belloff=all
	set listchars=tab:>\ ,eol:¬
	set clipboard=unnamedplus
	set guifont=DejaVu\ Sans\ Mono\ 16
else
	set clipboard=unnamed
endif

" colors
:if $DARK
	:set background=dark
	:colorscheme freya
:else
	:set background=light
	:colorscheme pyte
:end

" tab and spaces
set nosmarttab
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ffs=unix,dos

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
set formatoptions=qrn1
" leader
let mapleader = "\<Space>"
" search/move
set ignorecase
set smartcase
set gdefault "/g is default
set incsearch
set showmatch
set hlsearch

" ---------------------
" --- key mappings ----
" ---------------------

" remove word in insert mode
inoremap <A-BS> <C-W>

" folding
nnoremap z<space> za
xnoremap z<space> za
" window, tab and split screen navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
" splits
nnoremap <leader>_ :split<cr>
nnoremap <leader>\| :vsplit<cr>
nnoremap <leader>, :noh<cr>
" alt as cmd
nnoremap <M-t> :tabnew<cr>
nnoremap <M-w> :close<cr>
nnoremap <M-s> :w<cr>
" nnoremap <C-{> :tabprevious<cr>
" nnoremap <C-}> :tabnext<cr>

" edit vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
" search
nnoremap / /\v
vnoremap / /\v
" fugitive (git)
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>
" CtrlP
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <f5> :CtrlPClearCache<cr>
" nerdtree
map <F1> :NERDTreeToggle \| :silent NERDTreeMirror<cr>
inoremap <F1> <esc>:NERDTreeToggle<cr>
" EOL chars
nmap <F3> :set list!<cr>
nnoremap <F4> :set nolist wrap!<cr>
" up/down through wraps
nnoremap j gj
nnoremap k gk
" bash-like nav
nnoremap <C-a> ^
nnoremap <C-e> $
" Trailing whitespace removal
map <f8> :%s/\s\+$//<cr>

" -----------------------
" --- plugin settings ---
" -----------------------

" NERDTree
let NERDTreeIgnore=['.vim$']
let NERDTreeShowHidden=1

" CtrlP
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_custom_ignore = { 'dir': '_builds\|deps\|node_modules\|bower_components\|DS_Store\|git' }
set wildignore+=*/target/*,*/_build/*,*/tmp/*,*.so,*.swp,*.zip,*.log,.DS_Store

" airline
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1

" Markdown, disable folding
let g:vim_markdown_folding_disabled = 1

" ALE + Deoplete
" let g:ale_elixir_elixir_ls_release = '/home/neektza/Work/elixir-ls/rel'
" let g:ale_completion_enabled = 1
" let g:deoplete#enable_at_startup = 1

" ---------------------
" --- auto commands ---
" ---------------------

" Elixir 
augroup elixir
  autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>
augroup END

" Capistrano
autocmd BufRead,BufNewFile *.cap set filetype=ruby
autocmd BufRead,BufNewFile Capfile set filetype=ruby

" Ruby
autocmd Filetype ruby setlocal et ts=2 sts=2 sw=2

" Spellcheck
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md set complete+=kspell
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NERDTree
au Filetype nerdtree setlocal nolist


" -----------------------
" --- custom commands ---
" -----------------------

" XML formatting
:command! FormatXML %!xmllint --format -

" JSON formatting
:command! FormatJSON %!json_pp

" HTML formatting
:command! FormatHTML %!tidy -q -i --show-errors 0

" YAML formatting
:command! FormatYAML %!yamlint %




" " gutentags
" let g:gutentags_ctags_exclude=['.git', 'node_modules', 'deps', '_build']

" " tagbar
" map <F2> :TagbarToggle<cr>
" let g:tagbar_autofocus=1

" let g:tagbar_type_elixir = {
"     \ 'ctagstype' : 'elixir',
"     \ 'kinds' : [
"         \ 'f:functions',
"         \ 'functions:functions',
"         \ 'c:callbacks',
"         \ 'd:delegates',
"         \ 'e:exceptions',
"         \ 'i:implementations',
"         \ 'a:macros',
"         \ 'o:operators',
"         \ 'm:modules',
"         \ 'p:protocols',
"         \ 'r:records',
"         \ 't:tests'
"     \ ]
" \ }
