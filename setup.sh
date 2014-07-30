#!/bin/sh

cd `/usr/bin/dirname $0`

install(){
  if test ! -h ~/$1
  then
    echo "install $1"
    cp ./$1 ~/$1
  else
    echo "$1 already exists"
  fi
}

#install NeoBundle
if test ! -e ~/.vim/bundle/neobundle.vim
then
  echo "install NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

install .vimrc
install .zshrc

