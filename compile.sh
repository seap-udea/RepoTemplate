#!/bin/bash
. .reporc

#Default values
TYPE="PRODUCTION"
OUT="out"

#Command line
if [ "x$1" != "x" ];then TYPE=$1;shift;fi

if [ $TYPE = "TESTING" ]
then 
    OUT="tout"
    TYPE=$TYPE make tests/test_Module.$OUT
fi

#Compile programs
TYPE=$TYPE make Program.$OUT
