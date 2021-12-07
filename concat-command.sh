#!/bin/bash

order="docker images"
# exec $order | grep workflow-controller
order="docker run"
param="-it --rm --entrypoint=bash"
var=CHINA
p1=1000
p2=1001
env="-e CHINA=$var
     -e yes=YES"
port="-p $p1:$p1
      -p $p2:$p2"
image=reg.real-ai.cn/rsc/rsc_psi
version=v1.3.2
exec $order $param $env $port $image:$version
