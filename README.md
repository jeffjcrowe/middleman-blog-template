# Example Middleman based blog

See [crowe.ninja/blog/2015-08-28-this-site](http://www.crowe.ninja/blog/2015-08-28-this-site/) for details and configuration info

Available on [github](https://github.com/jeffjcrowe/middleman-blog-template) and [bitbucket](https://bitbucket.org/jeffcrowe/middleman-blog-template).
Note that unlike github, bitbucket allows private forks of public repos, so that may be preferable to allow an easy pull of any future changes.

Customize the _site_ in config.rb as needed

## Contains:

* middleman
* middleman-blog plugin
* configuration for directory-based blog entries
* lib/blog_helpers.rd addition for including source files

## Build Environment

If you have Ruby installed and would like to use it, then it should work correctly.

Alternately, a Docker-based build is also included here to make a 'known-good' environment easily available.
First ensure that you have Docker correctly [installed](http://docs.docker.com/engine/installation/)

The two main scripts you need:

* build.sh -> Build the site to static html and upload to S3 (ensure that config.rb is updated with S3 keys before doing this)
* server.sh -> Run a server to host the site locally for testing

Other potentially useful scripts:

* bundle-update.sh -> Only required if you make changes to the Gemfile. Installs Gem updates (bundle install)
* clean-env.sh -> Use if environment gets messed up for any reason. Clears out the Docker container so you can start over
* run-in-docker.sh -> Not needed normally. Used by the other scripts for running commands inside Docker
