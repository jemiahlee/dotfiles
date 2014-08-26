#!/bin/bash -x -i

SSH_KEY_LIST="ssh-add -l"

for file in /Users/"$USER"/.ssh/*id_rsa
do
	present=`$SSH_KEY_LIST | /usr/bin/grep ${file}`

	if [ -z "$present" ]; then
		echo "Adding $file to the SSH keychain"
		ssh-add $file
	fi
done
