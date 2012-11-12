" .vimrc
" Author: Kai Richard König
" Website: http://kairichardkoenig.com
" Inspired by a lot of people
set nocompatible    " use vim defaults

call pathogen#infect()

set ls=2            " allways show status line

set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set expandtab 		  " tab gets expanded to spaces
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off erroddr beep/flash
set nobackup        " do not keep a backup file
set number          " show line numbers
set noswapfile      " No need to keep a swap file
set nowrap 			    " Do not wrap lines
set scrolloff=20    " Always keep line visible
set hidden          " Lets u open new files with unsaved buffers
set cursorline      " Highlight the current line
set incsearch       " inceremental searching
set exrc            " Enable Projectspecific settings
set secure          " disable shellexcutions
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins


set pastetoggle=<F2>    " Turn off that smart ass when pasting large protions of text
" replace Ruby 1.8 hash-syntax with new 1.9 json style
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" replace cursors iTerm
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Replace <LEADER>
let mapleader = '_'

let g:ackprg="ack -H --nocolor --nogroup --column"
let g:fuf_buffer_keyDelete = '<C-d>'
let g:ruby_debugger_builtin_sender = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_force_overwrite_completefunc = 1
let g:ctrlp_map = 'tt'

let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=2
let g:syntastic_auto_jump=0
" Some remapping/shortcuts 
nmap <silent> ff :FufBuffer<CR>
nnoremap <C-S-p> :NERDTree<CR>
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

" Ignore these filenames during enhanced command line completion.
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png,*.mov,*.ttf " binary images + movies + fonts
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

if has("gui_running")

  colorscheme mustang 
  set fuopt=maxvert,maxhorz " Use maxinum screen space in fullscreen mode

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

""" get from gb website's vimrc""""""""""""""""""""""""""""""""""""""
function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~/", "g")
  return curdir
endfunction

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


"set statusline=
"set statusline+=[%F%M%R%W] "path to the file in the buffer, relative to current directory
"set statusline+=\::[%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding}, " encoding
"set statusline+=%{&fileformat}] " file format
"set statusline+=%<
"set statusline+=%=
"set statusline+=\ Line:%l/%L
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}




