function current_git_branch {
    if [ -n "${TMUX}" ]; then
        eval "$(tmux show-environment -s)"
    fi
    echo `git branch --no-color 2> /dev/null | perl -n -e 'next unless /^\s*\*\s*(?:\[\d+\]\s*)?(.*)/; print "[$1]"; exit;'`
}

export CLICOLOR=1
export PS1="\[\033[36m\]$(hostname) \[\033[35m\](\t) \[\033[32m\]\w \[\033[33m\]\$(current_git_branch)\[\033[00m\]$\[\033[00m\] "
export SUDO_PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[0m\]'
