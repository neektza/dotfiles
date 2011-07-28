set nocompatible	" use vim defaults
set ls=2			" allways show status line
set tabstop=4		" numbers of spaces of tab character
set shiftwidth=4	" numbers of spaces to (auto)indent
set scrolloff=5		" keep 3 lines when scrolling
set showcmd			" display incomplete commands
set nohlsearch		" highlight searches
"set incsearch		" do incremental searching
"set ruler			" show the cursor position all the time
"set novisualbell	" turn off visual bell
"set nobackup		" do not keep a backup file
set number          " show line numbers
"set ignorecase		" ignore case when searching
"set noignorecase   " don't ignore case when searching

set title           " show title in console title bar
set ttyfast         " smoother changes

set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines

set noautoindent
set nosmartindent
set nocindent  

set nowrap         " don't wrap lines

syntax on           " syntax highlighing

set mouse=a
map <F6> :NERDTreeToggle<CR>

:nmap <S-tab> :tabprevious<CR>
:nmap <tab> :tabnext<CR>
