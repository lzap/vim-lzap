#!/bin/bash

# update gocode
go get -u github.com/nsf/gocode

# update plugins
git submodule foreach git pull origin master
