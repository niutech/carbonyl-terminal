@echo off
set USER_HOST=carbonyl@app.kodus.pl
set RSA_KEY=carbonyl_rsa
set SSH_CMD=ssh -C -i %RSA_KEY% -p 2222 -o StrictHostKeyChecking=no
set MOSH_CMD=wsl MOSH_TITLE_NOPREFIX=1 mosh -p 60000:60100 --ssh="%SSH_CMD:-i =-i ~/.ssh/%" %USER_HOST%
echo Connecting to Carbonyl...
%MOSH_CMD% || %SSH_CMD% %USER_HOST%
