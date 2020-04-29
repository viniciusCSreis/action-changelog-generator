#!/bin/bash
# mails="viniciusCSreis/action-changelog-generator"
# mails2=$(echo $mails | tr "/" "\n")
# n=0
# result[0]=""
# for addr in $mails2
# do
#     result[0] = $addr
# done
# for addr2 in result
# do
#     echo "${addr2}"
# done=

str="viniciusCSreis/action-changelog-generator"
IFS='/'
ary=($str)
echo "${ary[0]}"
echo "${ary[1]}"