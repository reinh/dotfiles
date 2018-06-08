export GOPATH=$HOME/src/go

# Set the list of directories that info searches for manuals.
infopath=(
    /usr/local/share/info
    /usr/share/info
    $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
    /usr/local/share/man
    /usr/share/man
    $manpath
)

for path_file in /etc/manpaths.d/*(.N); do
    manpath+=($(<$path_file))
done
unset path_file

# Set the list of directories that Zsh searches for programs.
path=(
    ~/.local/bin
    /usr/local/{bin,sbin}
    /usr/{bin,sbin}
    /{bin,sbin}
    ~/bin
    /usr/local/Cellar/node/7.10.0/bin
    ~/.cargo/bin
    ~/.local/bin
    $path
    /opt/X11/bin
    /usr/local/opt/texinfo/bin
    /Library/TeX/texbin
    $GOPATH/bin
)

# Browser (Default)
if [[ "$OSTYPE" == darwin* ]]; then
    export BROWSER='open'
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RUST
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# rustup
fpath+=~/.zfunc


# GOLANG
export GOPATH=$HOME/src/go

# https://stackoverflow.com/questions/11670935/comments-in-command-line-zsh
setopt interactivecomments
