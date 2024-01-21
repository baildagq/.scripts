#!/bin/bash

# 遍历当前目录下的所有子目录

function travarse {
    path=$(pwd)
    cd $1
    find . -maxdepth 1 -type d | while read -r dir; do
        if [ "$dir" = "." ]; then
            continue
        fi
        if [ "$dir" = "./" ]; then
            continue
        fi
        if [ -d "$dir/.git" ]; then
            remote_url=$(git -C "$dir" config --get remote.origin.url)
            # 输出仓库路径和远程地址
            # echo "Git repository found at: $dir"
            echo "Remote URL: $remote_url"
			# # 获取当前分支
    		# branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD)
            #
			# # 检查是否有未提交的更改
    		# if [ -n "$(git -C "$dir" status --porcelain)" ]; then
    		#     echo "当前分支 $branch 有未提交的更改。"
    		# fi
            #
    		# # 检查是否有未推送的更改
			# condition=$(git -C "$dir" diff --quiet HEAD origin/$branch)
    		# if [ ! condition ]; then
    		#     echo "当前分支 $branch 有未推送的更改。"
    		# fi

            continue
        fi
        travarse $dir
    done
    cd $path
}

travarse $1
