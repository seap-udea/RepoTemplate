#!/bin/bash
. .reporc

find . -type f \
    |grep -v "./.git/" \
    |grep -E "util/repo/|util/sonar/|./.reporc" \
    |sed -e "s/.\///" \
    |tee $UTIL/repo/files.list |tee $UTIL/repo/repofiles.list

