export PATH=$HOME/bin:$PATH
export EDITOR=vim
# export PAGER='col -b | vim -c "map q :q!<CR>" -R -'


if [[ -s /Users/reinh/.rvm/scripts/rvm ]] ; then source /Users/reinh/.rvm/scripts/rvm ; fi
[ ! -f /etc/git-completion.bash ] || . /etc/git-completion.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Git prompt
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir [master] $   # clean working directory
#   username@Machine ~/dev/dir [master*] $  # dirty working directory
# djmitche: *edit* an existing PS1 to add the git information
# djmitche: only invoke 'git' and 'sed' once (each) for each prompt
# djmitche: display [NO BRANCH] when not on a branch (e.g., during rebase -i)
# djmitche: almost completely replace with __git_ps1 from git contrib, which
#           gives more information and avoids calling git scripts if possible

# Based on:
#  http://repo.or.cz/w/git.git/blob/HEAD:/contrib/completion/git-completion.bash
# 
# Copyright (C) 2006,2007 Shawn O. Pearce <spearce@spearce.org>
# Conceptually based on gitcompletion (http://gitweb.hawaga.org.uk/).
# Distributed under the GNU General Public License, version 2.0.

# __gitdir accepts 0 or 1 arguments (i.e., location)
# returns location of .git repo
__gitdir ()
{
    if [ -z "${1-}" ]; then
        if [ -n "${__git_dir-}" ]; then
            echo "$__git_dir"
        elif [ -d .git ]; then
            echo .git
        else
            git rev-parse --git-dir 2>/dev/null
        fi
    elif [ -d "$1/.git" ]; then
        echo "$1/.git"
    else
        echo "$1"
    fi
}

# __git_ps1 accepts 0 or 1 arguments (i.e., format string)
# returns text to add to bash PS1 prompt (includes branch name)
__git_ps1 ()
{
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local r
        local b
        if [ -f "$g/rebase-merge/interactive" ]; then
            r="|REBASE-i"
            b="$(cat "$g/rebase-merge/head-name")"
        elif [ -d "$g/rebase-merge" ]; then
            r="|REBASE-m"
            b="$(cat "$g/rebase-merge/head-name")"
        else
            if [ -d "$g/rebase-apply" ]; then
                if [ -f "$g/rebase-apply/rebasing" ]; then
                    r="|REBASE"
                elif [ -f "$g/rebase-apply/applying" ]; then
                    r="|AM"
                else
                    r="|AM/REBASE"
                fi
            elif [ -f "$g/MERGE_HEAD" ]; then
                r="|MERGING"
            elif [ -f "$g/BISECT_LOG" ]; then
                r="|BISECTING"
            fi

            b="$(git symbolic-ref HEAD 2>/dev/null)" ||
            b="$(git name-rev --name-only HEAD  2> /dev/null)" ||
            b="unknown"
        fi

        local w
        local i
        local s
        local u
        local c

        if [ "true" = "$(git rev-parse --is-inside-git-dir 2>/dev/null)" ]; then
            if [ "true" = "$(git rev-parse --is-bare-repository 2>/dev/null)" ]; then
                c="BARE:"
            else
                b="GIT_DIR!"
            fi
        elif [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
            if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ]; then
                git diff --no-ext-diff --quiet --exit-code || w="⚡"
                if git rev-parse --quiet --verify HEAD >/dev/null; then
                    git diff-index --cached --quiet HEAD -- || i="+"
                else
                    i="#"
                fi
            fi
            if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ]; then
                    git rev-parse --verify refs/stash >/dev/null 2>&1 && s="$"
            fi

            if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ]; then
               if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                  u="%"
               fi
            fi
        fi

        local f="$w$i$s$u"
        printf "${1:- (%s)}" "$c${b##refs/heads/}${f:+ $f}$r"
    fi
}

# set up prefs
GIT_PS1_SHOWDIRTYSTATE=1

# prompt with git status and last exit status
# PS1="[\`if [ \$? = 0 ]; then echo \[\e[32m\]✓\[\e[0m\]; else echo \[\e[31m\]Х\[\e[0m\]; fi\` \u@\h:\w\[\e[33m\]\`__git_ps1\`\[\e[0m\]]\\$ "
export PS1="╔[\`if [ \$? = 0 ]; then echo \[\e[32m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\` \u@\h:\w\[\e[33m\]\`__git_ps1\`\[\e[0m\] \$(~/.rvm/bin/rvm-prompt)]\n╚\\$ "


# Functions

ackl() {
  exec ack --color "$@" | less -R
}

# Aliases

alias sc=script/console

alias git=hub
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

alias mysql_start=/usr/local/Cellar/mysql/5.1.44/share/mysql/mysql.server\ start

alias ..=cd\ ..
alias ...=cd\ ../..

alias rscreen=screen\ -c\ ~/.rails_screenrc

alias itunes_ssh='ssh -L 3689:home.reinh.com:3689 -N home.reinh.com'

alias google=ack

alias less='less -R'

[ fortune ] && [ cowsay ] && fortune | cowsay
