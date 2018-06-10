source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating zgen init file"

    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load andrewferrier/fzf-z
    zgen load denysdovhan/spaceship-prompt spaceship

    zgen oh-my-zsh plugins/rake-fast

    zgen save
fi
