function take() {
    mkdir -p $1
    cd $1
}

# Usage: clone-all organization_name
function clone-all {
    if [[ -n "$GITHUB_TOKEN" ]]; then
        curl -u "$GITHUB_USER:$GITHUB_TOKEN" -s "https://api.github.com/orgs/$1/repos?per_page=200" | \
            ruby -rubygems -rjson -e 'JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'
    else
        echo 'Set $GITHUB_TOKEN to use clone-all'
    fi
}

function create-typescript-app {
    npx create-react-app "$1" --scripts-version=react-scripts-ts
}

fzf_log() {
    hash=$(git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |  fzf | awk '{print $1}')
    echo $hash | xclip
    git showtool $hash
}
