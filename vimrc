filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible    " use vim defaults
set ls=2            " allways show status line

set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set expandtab 		" tab gets expanded to spaces
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off erroddr beep/flash
set nobackup        " do not keep a backup file
set number          " show line numbers
set nowrap 			" Do not wrap lines

set incsearch       " inceremental searching
set cursorline

filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins


" set statusline+=%{rvm#statusline()}
set statusline=%f%m%w

" Replace <LEADER>
let mapleader = '_'

" Some remapping/shortcuts 
nmap <silent> <C-t> :CommandT<CR>
nmap <silent> <C-f> :FufBuffer<CR>
nmap <silent> <C-P> :NERDTree<CR>

if has("gui_running")

    colorscheme monokai

    " set default size: 90x35
    set columns=150
    set lines=35
    " No menus and no toolbar
    set guioptions-=m
    set guioptions-=T
    " No scrollbar
    set guioptions+=LlRrb
    set guioptions-=LlRrb

    if has("win32") || has("win64")
        " do nothing
    elseif has("mac")
       set guifont=Envy\ Code\ R:h10
    else
       set directory=/tmp
       set guifont=Envy\ Code\ R\ 10
    endif
    
    " Remap ctrl+space for omin-completion
    inoremap <silent> <C-Space> <C-X><C-O>

else 
    if has("unix")
	    inoremap <silent> <Nul> <C-X><C-O>
    endif

    if &term == "xterm"
        colorscheme ir_black
    end

endif

" Always set Envy Code Font based on System


" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Set Search Highlight to reverse color
hi Search gui=reverse
hi Search cterm=reverse
hi Search term=reverse



