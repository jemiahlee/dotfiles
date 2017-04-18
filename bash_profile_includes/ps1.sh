function current_git_branch {
    # echo -e `print_branch`
    BRANCH=`print_branch`
    local exit=$?

    if [[ -z "$BRANCH" ]]; then
      exit
    fi

    YELLOW='\033[0;33m'
    WHITE='\033[1;37m'
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    DEFAULT='\033[0m'

    if [[ $exit -eq 0 ]]; then
      echo -n -e "$GREEN"
    elif [[ $exit -eq 1 ]]; then
      echo -n -e "$RED"
    elif [[ $exit -eq 2 ]]; then
      echo -n -e $YELLOW
    elif [[ $exit -eq 3 ]]; then
      echo -n -e $WHITE
    fi

    echo -n $BRANCH
    echo -e "$DEFAULT"
}

export CLICOLOR=1
export PS1="\[\033[0;36m\]\h:\w \$(current_git_branch)\[\033[0;36m\]$\[\033[0m\] "
export SUDO_PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[0m\]'
