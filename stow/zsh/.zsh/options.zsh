# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-chpwd_005frecent_005fdirs
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Zle/url-quote-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload zmv

setopt auto_cd
setopt auto_pushd
setopt multios
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushdminus

# Edit with emacs
export VISUAL="emacsclient"
export EDITOR="emacsclient"
export ALTERNATE_EDITOR=""

## pager
export PAGER='less'
export LESS='-R'

export RIPGREP_CONFIG_PATH=~/.ripgreprc
