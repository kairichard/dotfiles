" .vimrc
" Author: Kai Richard König
" Website: http://kairichardkoenig.com
" Inspired by a lot of people
set nocompatible    " use vim defaults

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

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
set noswapfile      " No need to keep a swap file
set nowrap 			" Do not wrap lines
set scrolloff=20    " Always keep line visible


set hidden          " Lets u open new files with unsaved buffers

set incsearch       " inceremental searching

filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins


set pastetoggle=<F2>    " Turn off that smart ass when pasting large protions of text

" Replace <LEADER>
let mapleader = '_'

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:fuf_buffer_keyDelete = '<C-d>'
let g:ruby_debugger_builtin_sender = 0
" Some remapping/shortcuts 
nmap <silent> <C-t> :CommandT<CR>
nmap <silent> <C-f> :FufBuffer<CR>
nmap <silent> <C-P> :NERDTree<CR>

cmap wb Bclose
cmap W w
" Open split windo on jump in it
nnoremap <leader>v <C-w>v<C-w>l 
nnoremap <leader>h <C-w>s<C-w>l 
" Split window navigation
nnoremap <C-S-Left>  <C-w>h
nnoremap <C-S-Down>  <C-w>j
nnoremap <C-S-Up>    <C-w>k
nnoremap <C-S-Right> <C-w>l

" Remap ESC since its too far away
inoremap jj <ESC>

" Learn how to not use the freaking arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


if has("gui_running")

    colorscheme mustang 

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
       set guifont=Manaco:h12
    else
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


" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Set Search Highlight to reverse color
hi Search gui=reverse
hi Search cterm=reverse
hi Search term=reverse
"hi Statusline gui=sn
" Fix Vims regexp-handling to be more like Perl
nnoremap / /\v
vnoremap / /\v


 "set statusline=%F%m%r%h%w\ [%{&fileformat}][%Y][%{&fileencoding}]\ [ln=%04l,col=%03v][%p%%]\ [LEN=%L]
 
 " %1* -> User1's highlight, %2*->User2's highlight
 " =   -> Separation point between left and right aligned items.
 " <   -> Where to truncate line if too long.  Default is at the start.
 "set statusline=%4*%<\ %1*[%F]
 "set statusline+=%4*\ %5*[%{&encoding}, " encoding
 "set statusline+=%{&fileformat}]%m " file format
 "set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
 
 """ get from gb website's vimrc""""""""""""""""""""""""""""""""""""""
 function! CurDir()
 let curdir = substitute(getcwd(), $HOME, "~/", "g")
 return curdir
 endfunction
 
  set statusline=
  set statusline+=[%F%M%R%W] "path to the file in the buffer, relative to current directory
  set statusline+=\::[%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&encoding}, " encoding
  set statusline+=%{&fileformat}] " file format
  set statusline+=%<
  set statusline+=%=
  set statusline+=\ Line:%l/%L
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "}}}




