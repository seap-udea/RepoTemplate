#!/bin/bash
. .pack/packrc
. $REPODIR/reporc

branch=$(cat .branch)
if [ "x$branch" = "x" ];then
    echo "You must choose which branch to update in .branch"
    exit 1
fi

rawuri=https://raw.githubusercontent.com/$GITREPO/$branch/

qsel=0
if [ "x$1" != "x" ]
then
    qsel=1
    array=("$@")
fi

for file in $(cat $REPODIR/repofiles.list |grep -v "#")
do
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
