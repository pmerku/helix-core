#!/bin/bash

mkdir -p $P4ROOT $P4SSLDIR
chown -R perforce:perforce $P4ROOT $P4SSLDIR
chmod -R 0700 $P4ROOT $P4SSLDIR

if echo "$P4PORT" | grep -q '^ssl:'; then
    p4 trust -y
fi

/opt/perforce/sbin/configure-helix-p4d.sh $P4NAME \
    -n \
    -p $P4PORT \
    -r $P4ROOT \
    -u $P4USER \
    -P "${P4PASSWD}" \
    --unicode \
    --case 0

p4 configure set lbr.proxy.case=1
p4 configure set auth.sso.allow.passwd=1
p4 configure set dm.keys.hide=2
p4 configure set dm.user.resetpassword=1

p4 typemap -o; cat typemap.txt | p4 typemap -i

tail -F $P4ROOT/logs/log