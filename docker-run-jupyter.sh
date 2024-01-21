#!/bin/bash

docker run --restart always --net host --privileged=true --name jupyter-base-notebook -v $(pwd):/home/jovyan/work jupyter/base-notebook
