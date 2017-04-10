function current_git_branch {
    branchname=`git branch --no-color 2> /dev/null | perl -n -e 'next unless /^\s*\*\s*(?:.\d+.\s*)?(.*)/; print "[$1]"; exit;'`

    if [[ ! -z $branchname ]]; then
      dirty=`git status --short`

      RED='\033[0;31m'
      WHITE='\033[0;37m'
      NC='\033[0m'

      if [[ -z $dirty ]]; then
        echo -e "${WHITE}${branchname} "
      else
        echo -e "${RED}${branchname} "
      fi
    fi

}

export CLICOLOR=1
export PS1="\[\033[36m\]\h:\w \$(current_git_branch)\[\033[36m\]$\[\033[0m\] "
export SUDO_PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[0m\]'
