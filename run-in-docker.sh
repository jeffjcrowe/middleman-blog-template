#!/bin/bash
cd $(dirname $0)

##### DOCKER BUILD ENVIRONMENT
# Docker build environment is automatically created as needed
# 'bundle install' is done during the build process
# If Gemfile is updated, run clean-env.sh to clear the build environment
NAME=middleman-blog-builder
if ! docker inspect $NAME &>/dev/null; then
  echo "Environment isn't built yet, creating $NAME.."
  docker run -v "$PWD":/src -i --name $NAME --publish 4567:4567 --entrypoint=bash ruby:2.2.3 << __EOF__
gem install bundle
cd /src
bundle install
__EOF__
fi

docker stop -t 0 $NAME

# Stop docker when ctrl-c is pressed
function ctrl_c() {
  echo "Exiting ..."
  docker stop -t 0 $NAME >/dev/null
}
trap ctrl_c INT

# Run in BG, otherwise "docker server" ignores ctrl-c and is hard to kill
echo "cd /src; $*" | docker start -i $NAME &
wait $!
