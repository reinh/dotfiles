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

# roll 4d6
function roll {
    local input num die total

    input="$1"
    if ! [[ $input =~ d ]]; then
        echo "usage: roll 2d6" 1>&2
        return 1
    fi

    # Index words, splitting by 'd' (1-indexed)
    num=$input[(ws:d:)1]
    die=$input[(ws:d:)2]

    # Roll some dice
    for ((n=0;n<$num;n++)); do
        m=$[${RANDOM} % $die + 1]
        let 'total += m'
    done

    echo $total
}
