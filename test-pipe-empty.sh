#!/bin/bash

ifne sh -c 'ls -al && exit 255'
case $? in
  0) echo empty;;
  255) echo success;;
  *) echo failure;;
esac

