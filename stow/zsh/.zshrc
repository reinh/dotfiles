# 1 to enable startup profiling
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
. ~/.zsh/options.zsh

. ~/.zsh/aliases.zsh
. ~/.zsh/completion.zsh
. ~/.zsh/directories.zsh
. ~/.zsh/dotenv.zsh
. ~/.zsh/extract.zsh
. ~/.zsh/functions.zsh
. ~/.zsh/history.zsh
. ~/.zsh/keybinds.zsh
. ~/.zsh/load_things.zsh
. ~/.zsh/more_fzf.zsh
. ~/.zsh/nvm.zsh
. ~/.zsh/vulkan.zsh

[[ $PROFILE_STARTUP = 1 ]] && zprof

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
