#!/bin/bash
. .reporc
find . -type f \
    |grep -v "./.git" \
    |grep -v ".sonarc$" \
    |grep -v ".reporc$" \
    |grep -v "\-\-" | $UTIL/repo/files.list
