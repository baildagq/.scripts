#!/bin/bash

cd ./src

find ./ -type f -name "*.h" -print0 | xargs -0 clang-format -i --style=Google
find ./ -type f -name "*.cc" -print0 | xargs -0 clang-format -i --style=Google
find ./ -type f -name "*.cpp" -print0 | xargs -0 clang-format -i --style=Google

