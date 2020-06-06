" .vimrc
" Author: Kai Richard König
" Website: http://kairichardkoenig.com
" Inspired by a lot of people

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" My bundles here:
" original repos on GitHub

NeoBundle 'AndrewRadev/sideways.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Raimondi/delimitMate.git'
NeoBundle 'godlygeek/tabular'
NeoBundle 'henrik/vim-indexed-search.git'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ivalkeen/vim-ctrlp-tjump'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'klen/python-mode'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'posva/vim-vue'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'timcharper/textile.vim.git'
NeoBundle 'tpope/vim-cucumber.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-git.git'
NeoBundle 'tpope/vim-haml.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'vim-ruby/vim-ruby.git'
NeoBundle 'qpkorr/vim-bufkill'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'arcticicestudio/nord-vim'

" YCM does not work on darwin
if has("unix")
  let s:uname = system("echo -ne $SUPERTAB")
  if s:uname == "1"
    NeoBundle 'ervandew/supertab'
  else
    NeoBundle 'Valloric/YouCompleteMe'
  endif
endif

call neobundle#end()

filetype plugin indent on     " required!
NeoBundleCheck

set ls=2            " allways show status line
set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set backspace=2     " behave like 'normal' backspace
set expandtab 		  " tab gets expanded to spaces
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb= " turn off erroddr beep/flash
set nobackup        " do not keep a backup file
set number          " show line numbers
set noswapfile      " No need to keep a swap file
set nowrap 			    " Do not wrap lines
set scrolloff=20    " Always keep line visible
set hidden          " Lets u open new files with unsaved buffers
set cursorline      " Highlight the current line
set exrc            " Enable Projectspecific settings
set history=1000    " Set history size
set relativenumber  " show linenumber relative to cursor
set modelines=5     " Enable magick vim header in files

set pastetoggle=<F7>

" Ignore these filenames during enhanced command line completion.
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png,*.mov,*.ttf " binary images + movies + fonts
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins

syntax on
colorscheme nord
set listchars=tab:▸\ ,eol:¬

let mapleader = ' '

let g:pymode_rope_regenerate_on_write = 0
let g:fuf_buffer_keyDelete = '<C-d>'
let g:ruby_debugger_builtin_sender = 0

" Hide snippet_complete marker.
"if has('conceal')
"set conceallevel=2 concealcursor=i
"endif

let g:ctrlp_map = 'tt'
let g:ctrlp_root_markers = ['.ctrlp']

let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=0
let g:syntastic_auto_jump=0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['css'],
                           \ 'passive_filetypes': ['python']}

let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_pylint_args = ['--rcfile=.pylint']
let g:syntastic_python_flake8_args = ['--config=.flake8']
let g:syntastic_aggregate_errors = 1

let g:pymode_breakpoint_cmd = 'import pudb; pu.db'
let g:pymode_lint = 0

let g:ackprg = 'rg --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

let g:airline_theme='luna'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 0

let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
let g:ctrlp_dotfiles = 1               "  show (.) dotfiles in match list
let g:ctrlp_dont_split = 'NERD_tree_2' " don't split these buffers

let g:rainbow_active = 0

nmap <leader>t :CtrlPtjump<CR>
nmap <leader>ct :CtrlPTag<CR>
nmap <leader>c :SyntasticCheck<CR>


" Set Search Highlight to reverse color
hi Search gui=reverse
hi Search cterm=reverse
hi Search term=reverse

" Some remapping/shortcuts
nmap <silent> ff :CtrlPBuffer<CR>
nmap <leader>l :set list!<CR>
nnoremap <C-S-p> :NERDTree<CR>
nnoremap <leader>sl :set hlsearch! hlsearch?<CR>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <leader>d: tag <C-R><C-W><CR>
" Open split windo on jump in it
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>l
" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <leader>z :BW<cr>

" with this, we can now type ",." to exit out of insert mode
" if we really wanted to type ",.", then just type one char, wait half a sec,
" type another
inoremap ,. <Esc>
vnoremap ,. <Esc>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null

" Split window navigation
nnoremap <C-S-Left>  <C-w>h
nnoremap <C-S-Down>  <C-w>j
nnoremap <C-S-Up>    <C-w>k
nnoremap <C-S-Right> <C-w>l

" Remap ESC since its too far away
inoremap jj <ESC>

" Learn how to not use the freaking arrow keys
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" guess who ignors wildignore
let NERDTreeIgnore = ['\.pyc$']

"let g:Powerline_symbols = 'fancy'

if has("gui_running")
  colorscheme tomorrow_night
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
endif


"hi Statusline gui=sn
" Fix Vims regexp-handling to be more like Perl
"nnoremap / /\v
"vnoremap / /\v

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


" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()


" Git commits.
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Subversion commits.
autocmd FileType svn       setlocal spell spelllang=en_us

autocmd FileType python setlocal completeopt-=preview

"set secure          " disable shellexcutions
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

if v:version >= 704
  " The new Vim regex engine is currently slooooow as hell which makes syntax
  " highlighting slow, which introduces typing latency.
  " Consider removing this in the future when the new regex engine becomes
  " faster.
  set regexpengine=1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Signify                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:signify_line_color_add    = 'DiffAdd'
let g:signify_line_color_delete = 'DiffDelete'
let g:signify_line_color_change = 'DiffChange'

" better highlighting for diffs
highlight DiffAdd cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete cterm=bold ctermbg=none ctermfg=167
highlight DiffChange cterm=bold ctermbg=none ctermfg=227

" highlight signs in Sy
highlight SignifySignAdd cterm=bold ctermbg=None  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=None  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=None  ctermfg=227

" highlight signs in Sy
highlight SignifyLineAdd cterm=bold ctermbg=None  ctermfg=119
highlight SignifyLineDelete cterm=bold ctermbg=None  ctermfg=167
highlight SignifyLineChange cterm=bold ctermbg=None  ctermfg=227

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Pymode                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode = 1
let g:pymode_options = 0
let g:pymode_folding = 0
let g:pymode_motion = 1
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_breakpoint = 1
let g:pymode_lint = 0
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_doc = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Ultrasnips                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Gundo                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" f5 toggles the Gundo plugin window
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width=80
