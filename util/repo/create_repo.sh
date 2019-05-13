#!/bin/bash
. .pack/packrc
. $REPODIR/reporc

#Reponame is directory name by default
reponame=$(basename $(pwd))

#Store branch
bash $repodir/getbranch.sh > .branch

echo "Removing all git information..."
mv .git .git.bak

echo "Creating GitHub repository $USER/$REPO (if this is not the right user ctrl+c and run: USER=<user> make repo)"
curl -o /dev/null -s -u "$USER" https://api.github.com/user/repos -d "{\"name\":\"$REPO\"}"

echo "Initializing repo..."
git init
git remote add origin https://github.com/$USER/$reponame.git
git add -A

echo "Commiting and pushing files..."
git commit -am "New Repo"
git push origin master

echo "#Automatically generate by make repo:" >> $repodir/reporc
echo "REPO=$REPO" >> $repodir/reporc
echo "USER=$USER" >> $repodir/reporc
git update-index --assume-unchanged $(REPODIR)/reporc

echo "Next: run 'make deps'"