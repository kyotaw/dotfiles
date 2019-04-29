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
add_source(){
  echo "source $1" >> ~/.zshrc.mine
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

install .pep8

# pyenv
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

# virtualenv
if test ! -e ~/.virtualenvs
then
	echo "install virtualenv"
	case ${OSTYPE} in
	  darwin*)
	    pip3 install virtualenv virtualenvwrapper
	    add_env VIRTUALENVWRAPPER_PYTHON /usr/local/bin/python3
	    add_source /usr/local/bin/virtualenvwrapper.sh
        ;;
    esac
fi

if [ -z $PYTHONDoNTWRITEBYTECODE ]; then
  add_env PYTHONDoNTWRITEBYTECODE 1
fi
