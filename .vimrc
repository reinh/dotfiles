silent! call pathogen#runtime_append_all_bundles()

set background=dark
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set syntax=automatic

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
set list " show tabs and trailing spaces
set listchars=tab:>-,trail:- " show tabs and trailing spaces
set scrolloff=4 " Keep 4 lines (top/bottom) for scope
set ruler
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

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */spec/**/*.rb compiler rspec
  autocmd BufNewFile,BufRead *spec.rb compiler rspec
  autocmd BufNewFile,BufRead */test/**/*.rb compiler ruby
  autocmd BufNewFile,BufRead *test.rb compiler ruby
augroup END

colorscheme vividchalk
set nu
set grepprg=ack

" Maps

map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
set tags+=../tags,../../tags,../../../tags,../../../../tags
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window=1

" Ruby completion

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Supertab

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
