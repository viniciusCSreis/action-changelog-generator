#!/bin/sh
github_changelog_generator -u $3 -p $2

ls
pwd

hub --version

echo "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"

git remote set-url origin "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"

export GITHUB_USER="$GITHUB_ACTOR"

hub pull-request --no-edit