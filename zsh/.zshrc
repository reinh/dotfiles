PROFILE_STARTUP=0
[[ $PROFILE_STARTUP = 1 ]] && zmodload zsh/zprof

GITHUB_USER=reinh

# TODO: Seriously, stop being lazy and fix this.
if [[ -f ~/.secrets.zsh ]]; then
    . ~/.secrets.zsh
else
    echo "Remember to store your secrets in ~/.secrets.zsh"
fi

. ~/.zsh/pre_options.zsh
. ~/.zsh/zgen_config.zsh
. ~/.zsh/load_things.zsh
. ~/.zsh/aliases.zsh
. ~/.zsh/completion.zsh
. ~/.zsh/functions.zsh
. ~/.zsh/keybinds.zsh
. ~/.zsh/history.zsh
. ~/.zsh/options.zsh
. ~/.zsh/prompt.zsh
. ~/.zsh/nvm.zsh

[[ $PROFILE_STARTUP = 1 ]] && zprof
