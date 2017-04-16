function current_git_branch {
    echo -e $(bin/print_branch)
}


export CLICOLOR=1
export PS1="\[\033[36m\]\h:\w \$(current_git_branch)\[\033[36m\]$\[\033[0m\] "
export SUDO_PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[0m\]'
