#!/bin/bash


str="viniciusCSreis/action-changelog-generator"
# for char in $str
# do
#     if [ "$char" = "/" ]
#     then
#         echo "$char"
#     else
#         echo "*"
#     fi
# done
str2=grep -o . <<< $str
for char in str2
do
    echo "$char"
done

# user=""
# repo=""
# for char in $str
# do
#     echo "user:$user"
#     echo "repo:$repo"
#     if test "${char}" = "/"
#     then 
#         repo= char
#         user+= repo
#     else 
#         repo="char"
#     fi
# done

# echo "$user"
# echo "$repo"