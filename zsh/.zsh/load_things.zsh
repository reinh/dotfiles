[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Lazy load nvm
function nvm() {
    . "$NVM_DIR/nvm.sh"
    nvm $@
}
. /usr/local/etc/profile.d/z.sh

# rbenv
eval "$(rbenv init -)"

# https://www.npmjs.com/package/npx
# source <(npx --shell-auto-fallback zsh)
