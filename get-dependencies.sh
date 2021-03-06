#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

#[ ! -d $rolesdir/kbrebanov.java ] && git clone https://github.com/kbrebanov/ansible-java $rolesdir/kbrebanov.java
[ ! -d $rolesdir/kbrebanov.java ] && git clone https://github.com/juju4/ansible-java $rolesdir/kbrebanov.java
[ ! -d $rolesdir/geerlingguy.java ] && git clone https://github.com/geerlingguy/ansible-role-java $rolesdir/geerlingguy.java

## galaxy naming: kitchen fails to transfer symlink folder
[ ! -e $rolesdir/juju4.jira ] && cp -R $rolesdir/ansible-jira $rolesdir/juju4.jira

## don't stop build on this script return code
true
