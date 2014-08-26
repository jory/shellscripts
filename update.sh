#!/usr/local/bin/zsh

if [[ -n $* ]]; then
    REPOS=($*)
else
    REPOS=(`ls -p | grep '/'`)
fi

for REPO in $REPOS; do
    cd $REPO
    if [[ -d .git ]]; then
        echo $REPO

        git stash
        git checkout master
        git pull

        if [[ -f package.json ]]; then
            npm install

            LOCALLY=`gfind node_modules -maxdepth 1 -lname '*'`

            if [[ -n $LOCALLY ]]; then
                echo '------------------------------------------'
                echo $LOCALLY
            fi
        fi

        echo '================================================================================'
    fi
    cd -
done
