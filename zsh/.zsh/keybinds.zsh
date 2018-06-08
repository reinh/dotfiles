# https://unix.stackexchange.com/questions/47349/what-does-zshs-magic-space-command-do
bindkey ' ' magic-space

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

