#!/bin/bash
. .pack/packrc
. $REPODIR/reporc


branch=$(cat .branch)
if [ "x$branch" = "x" ];then
    echo "You must choose which branch to update in .branch"
    exit 1
fi

rawuri=https://raw.githubusercontent.com/seap-udea/RepoTemplate/$branch/

qsel=0
if [ "x$1" != "x" ]
then
    qsel=1
    array=("$@")
fi

for file in $(cat $REPODIR/repofiles.list |grep -v "#")
do
    if [ $file = "reporc" -o $file = "sonarc" -o $file = "packrc" ];then continue;fi
    if [ $qsel -gt 0 ]
    then
	if [[ " ${array[@]} " =~ " ${file} " ]];then
	    :
	else
	    continue
	fi
    fi
    echo -n "Downloading $file: "
    curl -s -o $file $rawuri/$file
    echo "done."
done
