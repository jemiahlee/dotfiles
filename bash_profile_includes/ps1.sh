function current_git_branch {
	echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'`
}

export CLICOLOR=1
export PS1="\[\033[36m\]\h:\w \[\033[33m\]\$(current_git_branch)\[\033[00m\]$\[\033[00m\] "
export SUDO_PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[0m\]'
