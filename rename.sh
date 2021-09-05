#!/bin/bash 

# Rename all *.txt to *.text
for f in *.cc; do 
    mv -- "$f" "${f%.cc}.cpp"
done
