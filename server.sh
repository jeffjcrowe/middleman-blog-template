#!/bin/bash
cd $(dirname $0)

if which docker-machine &>/dev/null; then
  echo "You are using docker-machine, which runs containers inside of a Virtual Machine."
  echo "Your site will actually be available at http://$(docker-machine ip default):4567"
fi

./run-in-docker.sh "middleman --force-polling --verbose"
