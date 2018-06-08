export NVM_DIR="$HOME/.nvm"

# Lazy load nvm
function nvm() {
    . "$NVM_DIR/nvm.sh"
    nvm $@
}
