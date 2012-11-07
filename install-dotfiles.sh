#!/bin/sh

cd ~/
rm ~/.bashrc
rm ~/.vimrc
rm ~/.railsrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.railsrc ~/.railsrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

mkdir ~/bin
cd ~/bin
for i in ~/dotfiles/bin/* ; do ln -s $i ; done
ln -s ~/dotfiles/wizard/wizard

