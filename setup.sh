#!/bin/sh

cd `/usr/bin/dirname $0`

install(){
  echo "install $1"
  cp ./$1 ~/$1
}

installed(){
  echo "$1 already installed"
}

add_env(){
  echo "export $1=\"$2\"" >> ~/.zshrc.mine
}
add_path(){
  echo "export PATH=\"$1:\$PATH\"" >> ~/.zshrc.mine
}
add_stat(){
	echo $1 >> ~/.zshrc.mine
}

#for general
#create .zshrc.mine
if test ! -e ~/.zshrc.mine
then
  echo "create .zshrc.mine"
  touch .zshrc.mine
fi

#install NeoBundle
install .vimrc
install .zshrc

if test ! -e ~/.vim/bundle/neobundle.vim
then
  echo "install NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
else
  installed NeoBundle
fi

#for Python
echo "###setting up environment for Python"

if test ! -e ~/.pyenv
then
  echo "install pyenv"
  brew install pyenv-virtualenv
  add_env PYENV_ROOT '$'HOME/.pyenv
  add_path '$'PYENV_ROOT/bin
  add_stat 'eval "$(pyenv init -)"'
else
  installed pyenv
fi

