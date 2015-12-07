#!/bin/bash
cd $(dirname $0)

# First build the image with middleman, then use s3_sync plugin to upload to s3
./run-in-docker.sh middleman build
./run-in-docker.sh middleman s3_sync
