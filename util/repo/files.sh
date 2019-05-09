#!/bin/bash
. .reporc

find . -type f \
    |grep -v "./.git/" \
    |grep -v ".sonarc$" \
    |grep -v ".reporc$" \
    |grep -v "\-\-" \
    |sed -e "s/.\///" \
    |tee $UTIL/repo/files.list |tee $UTIL/repo/repofiles.list
