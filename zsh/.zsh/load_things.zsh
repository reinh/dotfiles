[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -f /usr/local/etc/profile.d/z.sh ]] && . /usr/local/etc/profile.d/z.sh

# rbenv
command -v rbenv >/dev/null && eval "$(rbenv init -)"

# https://www.npmjs.com/package/npx
# source <(npx --shell-auto-fallback zsh)
