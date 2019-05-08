#!/bin/bash
. .reporc

repodir=$UTIL/repo
rawuri=https://raw.githubusercontent.com/$GITREPO/master/

qsel=0
if [ "x$1" != "x" ]
then
    qsel=1
    array=("$@")
fi

for file in $(cat $repodir/repofiles.list |grep -v "#")
do
    if [ $qsel -gt 0 ]
    then
	if [[ " ${array[@]} " =~ " ${file} " ]];then
	    :
	else
	    continue
	fi
    fi
    echo "Downloading $file"
    echo wget -O $file $rawuri/$file
done

