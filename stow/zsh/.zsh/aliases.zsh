# exa
alias ll='exa -la'

# Emacs
alias e='emacsclient -t'

# GHC

alias ghci-core="ghci -ddump-simpl -dsuppress-idinfo \
  -dsuppress-coercions -dsuppress-type-applications \
  -dsuppress-uniques -dsuppress-module-prefixes"

alias ghc-core1="ghc -ddump-simpl -dsuppress-all"

# Bundle

alias be='bundle exec'

alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222&'

## super user alias
alias _='sudo'
alias please='sudo'
alias computer,='sudo'

# rsync
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"

alias -g C='| wc -l'
alias -g DN='/dev/null'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ER='|& rg'
alias -g ET='|& tail'
alias -g ETL='|& tail -20'
alias -g F=' | fmt -'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g L="| less"
alias -g LL="2>&1 | less"
alias -g LS='| less -S'
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g R='| rg'
alias -g S='| sort'
alias -g SN='| sort -n'
alias -g SNR='| sort -nr'
alias -g TL='| tail -20'
alias -g VM='/var/log/messages'
alias -g X0='| xargs -0'
alias -g X0G='| xargs -0 egrep'
alias -g X='| xargs'
alias -g XG='| xargs egrep'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# List directory contents
alias ls='exa'
alias l='exa -la'
alias la='exa -lah'
alias ll='exa -lah'

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
