#!/bin/bash -x -i

SSH_KEY_LIST="ssh-add -l"

if [ "x" == "x`ps -x -u ${USER} | egrep [s]sh-agent | egrep -v egrep`" ] ; then
	ssh-agent | sed -e "/^echo/d" > ${HOME}/.agent-env
fi
source ${HOME}/.agent-env

for file in /Users/"$USER"/.ssh/*id_rsa
do
	present=`$SSH_KEY_LIST | /usr/bin/grep ${file}`

	if [ -z "$present" ]; then
		echo "Adding $file to the SSH keychain"
		ssh-add $file
	fi
done
