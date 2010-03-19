export EDITOR=vim
PS1="[\u@\h:\w \`if [ \$? = 0 ]; then echo \[\e[32m\]✓\[\e[0m\]; else echo \[\e[31m\]Х\[\e[0m\]; fi\`]\\$ "

[ ! -f /etc/git-completion.bash ] || . /etc/git-completion.bash
