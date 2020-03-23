#!/bin/bash 
docker build . -t teste -f Dockerfile_Local
docker run teste