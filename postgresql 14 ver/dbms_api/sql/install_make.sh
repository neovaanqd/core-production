#!/bin/sh

if [ $# -ne 1 ]
then
  echo "install_make.sh D_INI_PATH"
  exit 1
fi

echo "D_INI_PATH is replaced by $1"
pwdpath=`echo $1|sed -e 's/\//\\\\\//g'`
cat 002.user_interface.post | sed -e "s/D_INI/${pwdpath}\/scpdb_agent.ini/g" > 002.user_interface.post.1
cat 001.inner_function.post | sed -e "s/D_INI/${pwdpath}/g" > 001.inner_function.post.1
cat 001.inner_function.post10 | sed -e "s/D_INI/${pwdpath}/g" > 001.inner_function.post10.1


mv -f 002.user_interface.post.1 002.user_interface.post.sql
mv -f 001.inner_function.post.1 001.inner_function.post.sql
mv -f 001.inner_function.post10.1 001.inner_function.post10.sql
