#!/bin/bash
github_changelog_generator -u $3 -p $2

ls
pwd

git checkout -b change-log
./push.sh