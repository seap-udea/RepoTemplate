#!/bin/bash
. .pack/packrc
. $REPODIR/reporc

find . -type f \
    |grep -v "./.git/" \
    |grep -E "util/repo/|util/sonar/|./.reporc" \
    |sed -e "s/.\///" \
    |tee $REPODIR/files.list |tee $REPODIR/repofiles.list

