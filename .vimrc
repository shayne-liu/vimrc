set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntastics
Plugin 'scrooloose/syntastic'
Plugin 'valloric/listtoggle'

" Git stuff
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Tabnine
Plugin 'zxqfl/tabnine-vim'

" Solarized
Plugin 'altercation/vim-colors-solarized'

" ctrlp
" Plugin 'ctrlpvim/ctrlp.vim'

" Ruby on rails stuff
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'

" fzf
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set number
syntax on

set background=dark
colorscheme solarized

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set bs=2                " fix backspace

" -----------------------------------------------------------------------------
" AG
" -----------------------------------------------------------------------------
"
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=2               " Tab key results in # spaces
set tabstop=2                   " Tab is # spaces
set shiftwidth=2                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.


" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" NERDTree
map <C-n> :NERDTreeToggle<CR>
" autocmd VimEnter * NERDTree | wincmd p

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
" airline manual: https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

let g:airline#extensions#branch#enabled = 1

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
set laststatus=2

" Syntastics
" syntastics manual: https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic.txt
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" fzf
" fzf commands: https://github.com/junegunn/fzf.vim
let g:fzf_command_prefix = ''
:nnoremap <silent> <C-p> :Files<CR>
:nnoremap <silent> <C-b> :Buffers<CR>
:nnoremap <silent> <C-f> :Lines<CR>
:nnoremap <silent> <C-k> :Tags<CR>
:nnoremap <silent> <leader>fbt :BTags<CR>
:nnoremap <silent> <leader>fw: Windows<CR>
:nnoremap <silent> <leader>fbl :BLines<CR>
:nnoremap <silent> <leader>fh :History<CR>

:nnoremap <silent> <leader>gl :Commits<CR>
:nnoremap <silent> <leader>ga :BCommits<CR>
:nnoremap <silent> <leader>ft :Filetypes<CR>

" fugitive
" fugitive commands: https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt
:nnoremap <silent> <leader>gs :Gstatus<CR>
:nnoremap <silent> <leader>gd :Gdiff<CR>
:nnoremap <silent> <leader>gc :Gcommit<CR>
:nnoremap <silent> <leader>gb :Gblame<CR>
:nnoremap <silent> <leader>ge :Gedit<CR>
:nnoremap <silent> <leader>gr :Gread<CR>
:nnoremap <silent> <leader>gw :Gwrite<CR>
:nnoremap <silent> <leader>gq :Gwq<CR>

" gitgutter
" giggutter commands: https://github.com/airblade/vim-gitgutter/blob/master/README.mkd
:nnoremap <silent> ]h :GitGutterNextHunk<CR>
:nnoremap <silent> [h :GitGutterPrevHunk<CR>
:nnoremap <silent> <leader>hw :GitGutterStageHunk<CR>
:nnoremap <silent> <leader>hu :GitGutterUndoHunk<CR>
:nnoremap <silent> <leader>hp :GitGutterPreviewHunk<CR><c-w>
:nnoremap <leader>ht :GitGutterToggle<CR>
:nnoremap <leader>gt :GitGutterAll<CR>

" -----------------------------------------------------------------------------
" MAPPINGS
" -----------------------------------------------------------------------------
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <C-X> :bdelete<CR>

