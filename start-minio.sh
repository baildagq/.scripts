#!/bin/bash

export MINIO_ROOT_USER=6bb3ec45fe2030a253f6c4a98ac6bb
export MINIO_ROOT_PASSWORD=af339076180e43f597c3dc780b1d33
minio server ~/minio-data --console-address ":9001"
