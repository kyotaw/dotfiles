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
defined(){
  eval echo '$'{$1-undef} 
  if [ env  = "undef" ]; then
	echo eeee
    if [ "'$'$env" = "" ]; then
		exit 0
    fi
  fi
  exit 1
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
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
  git clone git://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
  add_env PYENV_ROOT '$'HOME/.pyenv
  add_path '$'PYENV_ROOT/bin
  add_stat 'eval "$(pyenv init -)"'
else
  installed pyenv
fi

if [ -z $PYTHONDoNTWRITEBYTECODE ]; then
  add_env PYTHONDoNTWRITEBYTECODE 1
fi
