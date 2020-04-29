#!/bin/bash
str=$GITHUB_REPOSITORY
IFS='/'
arrIN=($str)
baseBranch=$2
changelogBranch=$3

github_changelog_generator -u ${arrIN[0]} -p ${arrIN[1]} --output CHANGELOG.md --no-issues-wo-labels --max-issues 0 --token $1 
git config user.email "you@example.com"
git config user.name "GitHub Bot"
git checkout "$baseBranch"
git checkout -b "$changelogBranch"
git add CHANGELOG.md
git remote set-url origin "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"
git commit -m "Generate Changelog"
git push --force origin "$changelogBranch"

COMMAND="curl --location --request POST 'https://api.github.com/repos/$GITHUB_REPOSITORY/pulls' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer $1' \
--data-raw '{
  \"title\": \"Changelog\",
  \"body\": \"Generate Change Log\",
  \"head\": \"$changelogBranch\",
  \"base\": \"$baseBranch\"
}'
"
sh -c "$COMMAND"