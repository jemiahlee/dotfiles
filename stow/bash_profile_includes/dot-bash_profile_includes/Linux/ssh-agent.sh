# Predictable SSH socket location
SOCK_DIR="/dev/shm/.ssh-$USER"
SOCK="$SOCK_DIR/ssh-agent"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f $SOCK
    if [ ! -d "$SOCK_DIR" ]; then
      mkdir $SOCK_DIR
      chown $USER:$USER $SOCK_DIR
      chmod 700 $SOCK_DIR
    fi
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
