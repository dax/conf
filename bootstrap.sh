#!/bin/sh

DEFAULT_LOCAL_CONF_DIR="${HOME}/.conf"
DEFAULT_REMOTE_CONF=none

[ -f "${HOME}/.confrc" ] && . "${HOME}/.confrc"
[ -z "$LOCAL_CONF_DIR" ] && LOCAL_CONF_DIR="$DEFAULT_LOCAL_CONF_DIR"
[ -z "$REMOTE_CONF" ] && REMOTE_CONF="$DEFAULT_REMOTE_CONF"

[ ! -f "${HOME}/.confrc" ] && cat <<EOF > "${HOME}/.confrc"
# -*- sh -*-

LOCAL_CONF_DIR=$LOCAL_CONF_DIR
REMOTE_CONF=$REMOTE_CONF
EOF

sudo apt-get -y install git
sudo apt-get -y install chef

mkdir -p "$LOCAL_CONF_DIR"
cd "$LOCAL_CONF_DIR"
git clone git://github.com/dax/conf.git
cd conf/conf
sudo chef-solo -Fdoc -c solo.rb -j solo_root.json -l fatal
chef-solo -Fdoc -c solo.rb -j solo.json -l fatal

export PATH=~/local/bin:$PATH
