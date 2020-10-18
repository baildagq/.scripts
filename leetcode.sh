#!/bin/bash

usage="$(basename "$0") [-h] [-t cpp/py] [-n name] -- program to make and edit code or run code

where:
    -h  show this help text
    -t  set the code type (defalut: cpp)
    -n  code name"

TYPE="cpp"
NAME_FLAG=false;
NAME=""

while getopts ':ht:n:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    t) TYPE=$OPTARG
       if [[ $TYPE != "cpp" && $TYPE != "py" ]]
       then
           echo "please input legal code type: [cpp/py]"
           exit 1
       fi
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
    n) NAME=$OPTARG
       NAME_FLAG=true;
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

shift $((OPTIND - 1))

if [[ $NAME_FLAG == false ]]
then
    echo "please input code name"
    exit 1
fi

case $TYPE in
    'cpp')
        basedir="./cplusplus"
        if ! test -e $basedir/$NAME.cpp
        then
            cp $basedir/base.cpp $basedir/$NAME.cpp 
            vim $basedir/$NAME.cpp
        else
            # g++ $basedir/$NAME.cpp -std=c++11 -Wall -Werror -fsanitize=address  -O0 -g -o ./exec/$NAME && \time ./exec/$NAME
            g++ $basedir/$NAME.cpp -std=c++11 -Wall -O0 -g -o ./exec/$NAME && ./exec/$NAME
        fi
        ;;
    'py')
        basedir="./python"
        if ! test -e $basedir/$NAME.py
        then
            cp $basedir/base.py $basedir/$NAME.py && vim $basedir/$NAME.py
        else
            python3 $basedir/$NAME.py
        fi
        ;;
    *)
        echo "the code type:$TYPE have not been supported"
        exit 1
        ;;
esac;
