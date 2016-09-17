alias ag='ag --ignore \*.json'

alias g=git
alias gpr="git pull --rebase"
alias gmu="git fetch upstream && git merge --ff-only upstream/master"
alias gitprune="git remote prune origin"
alias gst="git about && echo && git status"
alias gfa="git fetch upstream && git fetch"
alias ff="git fetch origin && git merge --ff-only origin/$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"

alias ll="ls -lah"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."

alias ls="ls -p --color"
alias vi='vi -u /usr/share/vim/vimrc'

alias more='less -F'
