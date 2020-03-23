#!/bin/sh
github_changelog_generator -u $3 -p $2

ls
pwd

git checkout -b change_log
git add .
git commit -m "changes"

git remote set-url origin "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"


git push origin change_log

