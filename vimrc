colorscheme ir_black

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off erroddr beep/flash
set nobackup        " do not keep a backup file
set number          " show line numbers
set nowrap 			" Do not wrap lines

" set statusline+=%{rvm#statusline()}

set statusline=%f%m%w
let mapleader = '_'
 
nmap <silent> <C-t> :CommandT<CR>
nmap <silent> <C-f> :FufBuffer<CR>

