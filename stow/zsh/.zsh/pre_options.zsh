export FZF_TMUX=1
export FZF_PREVIEW_COMMAND='tree -L 2 -x --noreport --dirsfirst {}'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules,Downloads,Applications,Maildir,Dropbox,Volumes}/*"'
export FZF_ALT_C_COMMAND="bfs -type d -nohidden 2>/dev/null | sed '/^\.$/d'"
export FZF_ALT_C_OPTS="--preview '${FZF_PREVIEW_COMMAND}'"

export _Z_EXCLUDE_DIRS=(
    $HOME/Downloads
    $HOME/Dropbox
    /Applications
    /Volumes
)

export FZFZ_EXCLUDE_PATTERN='\.git|Downloads|Volumes|Applications|Maildir|Dropbox|node_modules|Production|Share|tmp|common:'
