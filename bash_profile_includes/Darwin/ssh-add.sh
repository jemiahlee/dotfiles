#!/bin/bash -x -i

SSH_KEY_LIST="ssh-add -l"
AGENT_FILE="${HOME}/.agent-env"
SSH_LIST=`ssh-add -l`

if [[ -f $AGENT_FILE ]]; then
  source $AGENT_FILE
  if [ ! -e "$SSH_AUTH_SOCK" ]; then
    echo "Agent file out of date, removing..."
    rm $AGENT_FILE
  fi
fi

if [[ ! -f $AGENT_FILE ]]; then
  echo "Setting up ssh-agent"
  ssh-agent | sed -e "/^echo/d" > ${HOME}/.agent-env
fi

source $AGENT_FILE

for file in /Users/"$USER"/.ssh/id_rsa
do
	present=`$SSH_KEY_LIST | /usr/bin/grep ${file}`

	if [ -z "$present" ]; then
		echo "Adding $file to the SSH keychain"
		ssh-add $file
	fi
done
