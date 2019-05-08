#!/bin/bash
. .reporc
repodir=$UTIL/repo

qsel=0
if [ "x$1" != "x" ]
then
    qsel=1
    array=($@)
fi

IFS=$'\n'
recom=""
for deps in $(cat $repodir/deps.conf |grep -v "#")
do
    package=$(echo $deps |awk -F":" '{print $1}')
    cmd=$(echo $deps |awk -F":" '{print $2}')
    install=$(echo $deps |awk -F":" '{print $3}')

    if [ $qsel -gt 0 ]
    then
	if [[ " ${array[@]} " =~ " ${package} " ]];then
	    :
	else
	    continue
	fi
    fi

    echo -en "Checking for $package:"

    ninstall=$(eval echo $install)
    
    if ! eval $cmd &> /dev/null
    then
	echo -e "not installed."
	if [ "x$ninstall" = "x" ];then ninstall=":";fi
	recom="$ninstall;$recom"
    else
	echo -e "done."
    fi

done

if [ "x$recom" != "x" ]
then
    echo -e "Run these commands:\n$recom"
    exit 1
else
    echo "All done."
    exit 0
fi
