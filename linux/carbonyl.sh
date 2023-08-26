#!/bin/sh
USER_HOST="carbonyl@app.kodus.pl"
RSA_KEY="carbonyl_rsa"
export START_PAGE="https://start.duckduckgo.com/"
SSH_CMD="ssh -C -i $RSA_KEY -p 2222 -o StrictHostKeyChecking=no -o SendEnv=START_PAGE"
MOSH_CMD="MOSH_TITLE_NOPREFIX=1 mosh -p 60000:60100 --ssh=\"$SSH_CMD\" $USER_HOST"
[ `stat -c %a $RSA_KEY` -eq 600 ] || chmod 600 $RSA_KEY
echo Connecting to Carbonyl...
sh -c "$MOSH_CMD || $SSH_CMD $USER_HOST"