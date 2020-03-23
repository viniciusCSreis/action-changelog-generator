#!/bin/sh
github_changelog_generator -u $3 -p $2

ls
pwd

git config user.email "you@example.com"
git config user.name "Your Name"

git checkout -b change_log
git add .

git remote set-url origin "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"



git commit -m "changes"

git push --force origin change_log

COMMAND="curl --location --request POST 'https://api.github.com/repos/$GITHUB_ACTOR/$GITHUB_REPOSITORY/pulls' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer $1' \
--data-raw '{
  "title": "Change log",
  "body": "Generate Change Log",
  "head": "change_log",
  "base": "master"
}'
"
echo "$COMMAND"
sh -c "$COMMAND"