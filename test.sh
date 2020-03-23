#!/bin/sh

export GITHUB_ACTOR=viniciusCSreis
export GITHUB_REPOSITORY=viniciusCSreis/action-changelog-generator

docker build -t testelocal -f Dockerfile_Local 


echo $GITHUB_ACTOR
docker run testelocal -e GITHUB_ACTOR -e GITHUB_REPOSITORY