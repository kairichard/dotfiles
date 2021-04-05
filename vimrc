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

let g:python3_host_prog = '/Users/kai/.pyenv/versions/3.7.6/bin/python3'
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
NeoBundle 'honza/vim-snippets'
NeoBundle 'ivalkeen/vim-ctrlp-tjump'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'ctrlpvim/ctrlp.vim.git'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'posva/vim-vue'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-cucumber.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-git.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'vim-ruby/vim-ruby.git'
NeoBundle 'qpkorr/vim-bufkill'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'arcticicestudio/nord-vim'
NeoBundle 'mikewadsten/vim-gitwildignore'
NeoBundle 'numirias/semshi'
NeoBundle 'dense-analysis/ale'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'deoplete-plugins/deoplete-jedi'
NeoBundle 'moll/vim-bbye'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/deoppet.nvim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'juliosueiras/vim-terraform-completion'
"NeoBundle 'kyazdani42/nvim-web-devicons' " for file icons
"NeoBundle 'kyazdani42/nvim-tree.lua'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'

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
"set termguicolors
colorscheme nord
set listchars=tab:▸\ ,eol:¬

let mapleader = ' '

let g:jedi#completions_enabled = 0
let g:deoplete#enable_at_startup = 1

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

set completeopt-=preview

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:ale_python_auto_pipenv = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0


let g:ackprg = 'rg --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

let g:airline_theme='nord'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#ale#enabled = 1

let g:ctrlp_map = 'tt'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
let g:ctrlp_mruf_relative = 1          " Only show files in the current directory
let g:ctrlp_dotfiles = 1               "  show (.) dotfiles in match list
let g:ctrlp_dont_split = 'NERD_tree_2' " don't split these buffers
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']  " ignore everything that is listed in .gitignore
let g:rainbow_active = 0

nmap <leader>t :CtrlPtjump<CR>
nmap <leader>ct :CtrlPTag<CR>


" Set Search Highlight to reverse color
hi Search gui=reverse
hi Search cterm=reverse
hi Search term=reverse

" Some remapping/shortcuts
nmap <silent> mf :CtrlPMRU<CR>
nmap <silent> ff :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<cr>

nmap <leader>l :set list!<CR>

nnoremap <C-S-p> :NERDTree<CR>

nnoremap <leader>sl :set hlsearch! hlsearch?<CR>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 NerdTree                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight! link NERDTreeFlags NERDTreeDir
" guess who ignors wildignore
let NERDTreeIgnore = ['\.pyc$']
"
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
