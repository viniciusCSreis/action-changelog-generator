#!/bin/sh
github_changelog_generator -u $INPUT_REPO-USER -p $INPUT_REPO-NAME --token $1 --output CHANGELOG.md --cache-file CHANGELOG-CACHE --cache-log CHANGELOG-CACHE_LOG --issues false --issues-wo-labels false --filter-by-milestone false

git config user.email "you@example.com"
git config user.name "GitHub Bot"
git checkout -b changelog
git add CHANGELOG.md
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
sh -c "$COMMAND"