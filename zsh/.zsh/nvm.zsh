export NVM_DIR="$HOME/.nvm"

# Lazy load nvm
function nvm() {
    . "/usr/local/opt/nvm/nvm.sh"
    nvm $@
}
