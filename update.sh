#!/usr/local/bin/zsh

REPOS=(`ls -p | grep '/'`)

for REPO in $REPOS; do
    cd $REPO
    if [[ -d .git ]]; then
        echo $REPO
        git stash
        git checkout master
        git pull
        echo '------------------------------------------'
    fi
    cd -
done
