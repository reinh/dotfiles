# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-chpwd_005frecent_005fdirs
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*' menu select

setopt auto_cd
setopt multios
setopt prompt_subst

# Edit with emacs
export VISUAL="emacsclient -t"
export EDITOR="emacsclient -t"

## pager
export PAGER='less'
export LESS='-R'
