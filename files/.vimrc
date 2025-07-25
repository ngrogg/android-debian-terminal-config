" My .vimrc simplified
" Designed not to require plugins or additional files

" " Vim basics
" This must be first, because it changes other options as a side effect.
set nocompatible

" Required for vimwiki
filetype plugin on

" force 256 colors
set t_Co=256

" Use UTF-8 encoding
set encoding=utf-8

" Enable vim to use the system clipboard
set clipboard=unnamedplus

" Turn syntax on by default
syntax on

" Visual autocomplete for command menu
set wildmenu

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Always set autoindenting on
set autoindent

" Keep a backup file (restore to previous version)
set backup

" Keep an undo file (undo changes after closing)
set undofile

" Keep 50 lines of command line history
set history=50

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Sets a tab to be four spaces
set tabstop=4

" Converts tabs to spaces, useful if file moves to other systems
set expandtab

" " Visual changes
" Show line numbers
set number
set relativenumber

" Set vim colorscheme
colorscheme habamax

" configure CursorLines
set cursorline
hi CursorLine cterm=NONE ctermbg=232 ctermfg=15
hi CursorLineNr cterm=bold ctermbg=10 ctermfg=232

" " Vim Statusline
" Enable statusline
set laststatus=2
set statusline=

" Show current mode
" Define mode options
let g:currentmode={
       \ 'c'  : 'Command ',
       \ 'i'  : 'INSERT ',
       \ 'n'  : 'NORMAL ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 't'  : 'Term ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \}

" Define color
highlight Status1 ctermbg=10 ctermfg=232
highlight Status2 ctermbg=232 ctermfg=15

" Append to status line
set statusline+=\ %{toupper(g:currentmode[mode()])}%#Status1#

" Show full file path
set statusline+=File\ Path:%F

" Show if current file has been modified
set statusline+=%{&modified?'[+]':''}

" Set following options to right of window
set statusline+=%=

" Whitespace
set statusline+=%#Status2#
set statusline+=\\|

" Show current line number
set statusline+=Line\ Number:%l

" Whitespace
set statusline+=\\|

" Show total number of lines in file
set statusline+=Total:%L

" Whitespace
set statusline+=\\|

" Show percentage through file
set statusline+=%p%%\|

" " Vimsplit stuff
" Remap vimsplit navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Split settings for a more natural split
set splitbelow
set splitright

" " Keybindings
" Remap jj to escape
imap jj <esc>

" Auto close test for (, [, { in insert mode
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
