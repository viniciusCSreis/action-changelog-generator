#!/bin/sh
github_changelog_generator -u $3 -p $2 --token $1

ls
pwd

git config user.email "you@example.com"
git config user.name "GitHub Bot"
git checkout -b changelog
git add .
git remote set-url origin "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"
git commit -m "Generate Changelog"
git push --force origin changelog

COMMAND="curl --location --request POST 'https://api.github.com/repos/$GITHUB_REPOSITORY/pulls' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer $1' \
--data-raw '{
  \"title\": \"Changelog\",
  \"body\": \"Generate Change Log\",
  \"head\": \"changelog\",
  \"base\": \"master\"
}'
"
echo "$COMMAND"
sh -c "$COMMAND"