#!/bin/bash

touch ~/remote.txt

for instance in $(ls ./github); do
  echo ${instance}
  cd ./github/${instance}
  $(git remote -v >> ~/remote.txt)
  cd ../..
done
