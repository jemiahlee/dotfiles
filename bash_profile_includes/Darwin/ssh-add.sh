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

for ssh_type in {rsa,ed25519}
do
	present=`$SSH_KEY_LIST | /usr/bin/grep -i ${ssh_type}`

	if [ -z "$present" ]; then
		echo "Adding /Users/"$USER"/.ssh/id_$ssh_type to the SSH keychain"
		ssh-add /Users/"$USER"/.ssh/id_$ssh_type
	fi
done
