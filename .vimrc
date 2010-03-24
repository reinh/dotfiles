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
if has("mac")
  silent! set nomacatsui
else
  set lazyredraw
end
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
set smarttab

set splitbelow
set splitright

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P

set tags+=../tags,../../tags,../../../tags,../../../../tags,tmp/tags

set visualbell

" Force myself to use hjkl
map <down> <PageDown>
map <left> <nop>
map <right> <nop>
map <up> <PageUp>

imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>

" Autocommands

augroup puppet
    autocmd!
    autocmd BufRead ~/code/puppetlabs/puppet/**/*.rb set shiftwidth=4
augroup END

colorscheme vividchalk
set nu
set grepprg=ack

" Maps

map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
