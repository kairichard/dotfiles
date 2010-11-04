colorscheme ir_black

filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

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
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins


" set statusline+=%{rvm#statusline()}

set statusline=%f%m%w
let mapleader = '_'
" Some remapping/shortcuts 
nmap <silent> <C-t> :CommandT<CR>
nmap <silent> <C-f> :FufBuffer<CR>

if has("gui")
	inoremap <silent> <C-Space> <C-X><C-O>
else 
	if has("unix")
		inoremap <silent> <Nul> <C-X><C-O>
	end
end
" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Set Search Highlight to reverse color
hi Search gui=reverse
hi Search cterm=reverse
hi Search term=reverse



