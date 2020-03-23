#!/bin/sh
github_changelog_generator -u $3 -p $2

ls
pwd

git remote set-url origin "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY"

hub pull-request --no-edit