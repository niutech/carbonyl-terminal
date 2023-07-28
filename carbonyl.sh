#!/bin/sh
USER_HOST="carbonyl@app.kodus.pl"
RSA_KEY="~/.ssh/carbonyl_rsa"
SSH_CMD="ssh -C -i $RSA_KEY -p 2222 -o StrictHostKeyChecking=no"
MOSH_CMD="MOSH_TITLE_NOPREFIX=1 mosh -p 60000:60100 --ssh=\"$SSH_CMD\" $USER_HOST"
echo Connecting to Carbonyl...
$MOSH_CMD || $SSH_CMD $USER_HOST
