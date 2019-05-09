#!/bin/bash
. .reporc

repodir=$UTIL/repo
rawuri=https://raw.githubusercontent.com/$GITREPO/master/

branch=$(bash $repodir/getbranch.sh)
rawuri=https://raw.githubusercontent.com/$GITREPO/$branch/
echo $rawuri
exit 0

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
    echo -n "Downloading $file: "
    curl -s -o $file $rawuri/$file
    echo "done."
done
