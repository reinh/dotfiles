set background=dark
syntax enable
set syntax=automatic

filetype plugin indent on
set backspace=indent,eol,start " make backspace a more flexible
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp

set incsearch " BUT do highlight as you type you
               " search phrase
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines
                 " betweens rows
set list " we do what to show tabs, to ensure we get them
          " out of my files
set listchars=tab:>-,trail:- " show tabs and trailing
set scrolloff=4 " Keep 10 lines (top/bottom) for scope
set ruler

set autoindent

set expandtab
set tabstop=4
set shiftwidth=4

" Force myself to use hjkl
map <down> <PageDown>
map <left> <nop>
map <right> <nop>
map <up> <PageUp>

imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>
