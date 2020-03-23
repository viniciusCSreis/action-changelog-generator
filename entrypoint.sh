#!/bin/sh
github_changelog_generator -u $3 -p $2

ls
pwd

hub --version

echo "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"

git remote set-url origin "https://$GITHUB_ACTOR:$1@github.com/$GITHUB_REPOSITORY"

PR_ARG="$INPUT_PR_TITLE"
if [[ ! -z "$PR_ARG" ]]; then
  PR_ARG="-m \"$PR_ARG\""

  if [[ ! -z "$INPUT_PR_BODY" ]]; then
    PR_ARG="$PR_ARG -m \"$INPUT_PR_BODY\""
  fi
fi

if [[ ! -z "$INPUT_PR_REVIEWER" ]]; then
  PR_ARG="$PR_ARG -r \"$INPUT_PR_REVIEWER\""
fi

if [[ ! -z "$INPUT_PR_ASSIGNEE" ]]; then
  PR_ARG="$PR_ARG -a \"$INPUT_PR_ASSIGNEE\""
fi

if [[ ! -z "$INPUT_PR_LABEL" ]]; then
  PR_ARG="$PR_ARG -l \"$INPUT_PR_LABEL\""
fi

if [[ ! -z "$INPUT_PR_MILESTONE" ]]; then
  PR_ARG="$PR_ARG -M \"$INPUT_PR_MILESTONE\""
fi

COMMAND="hub pull-request \
  -b $DESTINATION_BRANCH \
  -h $SOURCE_BRANCH \
  --no-edit \
  $PR_ARG \
  || true"

echo "$COMMAND"
sh -c "$COMMAND"