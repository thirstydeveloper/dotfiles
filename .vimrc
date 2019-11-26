set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-rooter'
Plugin 'dense-analysis/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" General

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set laststatus=2                "Always display the status line
set hidden                      "Hide buffer instead of closing it
set pastetoggle=<F2>            "Paste without being smart

" Swap file and backups

set noswapfile
set nobackup
set nowb
au FocusLost * :wa

" Persistent undo

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Wrapping

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Folding

set nofoldenable                "don't fold by default
set foldmethod=syntax           "fold based on syntax

" " Search

set hlsearch
set incsearch
set ignorecase
set showmatch
set smartcase

" " Terminal

set termencoding=utf-8

" " Colors

syntax on
set cursorline
set background=dark
" let g:solarized_termcolors=256
colorscheme torte
highlight clear SignColumn

" " Scrolling

set scrolloff=4
set sidescrolloff=15
set sidescroll=1

" Fix syntax highlighting issues
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Write with sudo
cmap wi! %!sudo tee > /dev/null %

" Turn off search highlight
nnoremap <leader>a :noh<CR>

" Syntastic

let g:syntastic_mode_map = {
\ "mode": "active",
\ "active_filetypes": ["c", "cpp", "java", "javascript", "python", "ruby"],
\ "passive_filetypes": [] }

" NERDTree

"" Open NERDTree if no files were specified when vim was executed
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" Shortcut for toggling NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"" FZF config
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
noremap <C-o> :Files<CR>

"" git gutter

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0

let g:lightline = {
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"" vim-go

let g:go_fmt_command = "goimports"
