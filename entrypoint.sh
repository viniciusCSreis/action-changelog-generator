#!/bin/sh
github_changelog_generator -u $3 -p $2

ls
pwd

git checkout -b change_log
git add .
git commit -m "changes"

git remote set-url origin "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

git push origin change_log

curl --location --request POST "https://api.github.com/repos/$GITHUB_ACTOR/$GITHUB_REPOSITORY/pulls" \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer $1" \
--data-raw '{
  "title": "Change log",
  "body": "Generate Change Log",
  "head": "change_log",
  "base": "master"
}'