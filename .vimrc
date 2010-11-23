silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

colorscheme vividchalk

set background=dark
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set expandtab
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
set linespace=2 " don't insert any extra pixel lines betweens rows
set list " show tabs and trailing spaces
set listchars=tab:>- " show tabs
set scrolloff=3 " Keep 4 lines (top/bottom) for scope
set ruler
set splitbelow
set splitright

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P

set tags+=../tags,../../tags,../../../tags,../../../../tags,tmp/tags
set visualbell
set nu " line numbers
set grepprg=ack " FTW

" Autocommands

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */spec/**/*.rb,*_spec.rb compiler rspec " set the rspec compiler
  autocmd BufNewFile,BufRead */test/**/*.rb,*_test.rb compiler rubyunit " set the test unit compiler
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " use rubycomplete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby       set fdm=syntax fdl=99 " fold based on syntax, default fully open
  autocmd FileType ruby       set tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" Plugins

let Tlist_Use_Right_Window=1
nnoremap <silent> <F8> :TlistToggle<CR>

let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

let NERDSpaceDelims = 1

" Maps

let mapleader = ","

map <silent> <Leader>r :!ctags --extra=+f -R *<CR><CR>
map <Leader>s :Rake<CR>
map <Leader>c :.Rake<CR>
map <Leader>, <plug>NERDCommenterToggle

nmap <Leader>e :e **/
cmap <Leader>e **/

nmap <Leader>n :if &nu <bar> set nonu rnu <bar> else <bar> set nu nornu <bar> endif<CR>

augroup MARKDOWN
  autocmd!
  autocmd FileType markdown,man map <Leader>p :w<CR>:!markdown < % > %.html && open %.html<CR><CR>
  autocmd FileType markdown,man map <Leader>h1 :.g/.\+/copy. <Bar> s/./=/g <CR>
  autocmd FileType markdown,man map <Leader>h2 :.g/.\+/copy. <Bar> s/./-/g <CR>
augroup END

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" Display the syn/hi group of the word under the cursor
com! SynID echo synIDattr(synID(line("."), col("."), 1), "name") 

" allow a more natural style of line editing in :ex mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

map <F1> <nop>
imap <F1> <nop>

" highlight end of line whitespace as Error
hi link ExtraWhitespace Error
au BufNewFile,BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" except the line I am typing on
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Tabularize

command! Trim %s/\v\s+$//
command! Reload source ~/.vimrc | source ~/.gvimrc

" Highlight filetype
" Using highlight library
command! -range=% Highlight exec "w !highlight -S " . &ft . " -R | pbcopy"
