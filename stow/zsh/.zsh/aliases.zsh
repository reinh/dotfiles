
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