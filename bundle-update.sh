#!/bin/bash
cd $(dirname $0)

# Run when Gemfile is updated to ensure all dependencies are installed in the build container
./run-in-docker.sh "bundle install"
