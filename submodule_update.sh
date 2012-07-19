#!/bin/bash
# I never remember this:
git submodule foreach git pull origin master
pushd bundle/command-t/ruby/command-t
make clean
ruby extconf.rb
make
popd
