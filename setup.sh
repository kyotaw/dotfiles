#!/bin/sh

cd `/usr/bin/dirname $0`

install(){
  echo "install $1"
  cp ./$1 ~/$1
}

#for general
echo "###setting up environment for Python"

#install NeoBundle
install .vimrc
install .zshrc

if test ! -e ~/.vim/bundle/neobundle.vim
then
  echo "install NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
else
  echo "NeoBundle already installed"
fi

#for Python
echo "###setting up environment for Python"

if test ! -e ~/.pip 
then
  echo "install pip"
  wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
  echo "install virtualenv"
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper
else
  echo "pip already installed"
fi
source /usr/local/bin/virtualenvwrapper.sh

