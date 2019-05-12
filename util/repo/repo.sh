#!/bin/bash
. .reporc
REPO=$(basename $(pwd))

echo "Removing all git information..."
mv .git .git.bak

echo "Creating GitHub repository $USER/$REPO (if this is not the right user ctrl+c and run: USER=<user> make repo)"
curl -o /dev/null -s -u '$USER' https://api.github.com/user/repos -d '{"name":"$REPO"}'

echo "Initializing repo..."
git init
git add -A
cmd="git remote add origin $GITMETH-$USER$GITCHAR$USER/$REPO.git"
echo $cmd
exit 0

git commit -am "New Repo"
echo "Pushing files..."
git push origin master

echo "#Automatically generate by make repo:" >> .reporc
echo "REPO=$(REPO)" >> .reporc
echo "USER=$(USER)" >> .reporc

chmod +x $(UTIL)/sonar/tools/*
make repoinit

