#!/bin/sh

cd ~/
rm ~/.bashrc
rm ~/.vimrc
rm ~/.railsrc
rm ~/.vim

ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/.railsrc ~/.railsrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim

mkdir ~/bin
cd ~/bin
for i in ~/dotfiles/bin/* ; do ln -s $i ; done
ln -s ~/dotfiles/wizard/wizard

