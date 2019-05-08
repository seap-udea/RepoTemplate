find . -type f \
    |grep -v "./.git" \
    |grep -v ".sonarc$" \
    |grep -v ".reporc$" \
    |grep -v "\-\-"
