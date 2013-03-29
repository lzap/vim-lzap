#!/bin/sh
cd $HOME
ln -s .vim/_vimrc .vimrc
cd .vim

git config --global init.templatedir ~/.vim/git_template
