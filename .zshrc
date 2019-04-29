# Ushell configuration

# Prompt
autoload colors
colors

case ${UID} in
0)
	PROMPT="%B%{${fg[red]}%}%m%b%{${fg[cyan]}@%}%/#%{${fg[green]}%}"
	PROMPT2="%{${fg[blue]}%}%_#%{${fg[green]}%}"
	SPROMPT="%B%{${fg[red]%}%r%b%{${fg[green]}%} is correct? [n,y,a,e]:"
	;;
*)
	PROMPT="%{${reset_color}%}%n%{${fg[cyan]}@%}%~#%{${fg[green]}%}"
	PROMPT2="%{${fg[blue]}%}%_#%{${fg[green]}%}"
	SPROMPT="%B%{${fg[red]%}%r%b%{${fg[green]}%} is correct? [n,y,a,e]:"
	unset RPROMPT
	;;
esac

# Completion system
autoload -Uz compinit
compinit

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# History
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# Locale
export LANG=ja_JP.UTF-8
export LC_MESSAGE=C

# Directory change
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
# auto ls
function chpwd() { ls }

# Sugestion
setopt correct

# Color
export LS_COLORS="di=34;01:ln=32;01:pi=39;01:ex=31;01"
zstyle ':completion:*' list-colors 'di=34;01' 'ln=32;01' 'pi=39;01' 'ex=31;01'

# Others
setopt list_packed
setopt nolistbeep
setopt noautoremoveslash

# Pass
# Dependent on environment
case $(uname) in
  Linux)
    PATH=$PATH:~/bin/firefox
	;;
  CYGWIN*)
    PATH=$PATH:"/cygdrive/c/Program Files/Mozilla Firefox"
	PATH=$PATH:"/cygdrive/c/Program Files/Microsoft Office/Office11"
	PATH=$PATH:"/cygdrive/c/Program Files/Microsoft Office/Office12"
	PATH=$PATH:"/cygdrive/c/Program Files/Microsoft Visual Studio 9.0/Common7/IDE" 
	;;
esac

# Aliases
# General
setopt complete_aliases
alias df="df -h"
alias chrome="google-chrome"
alias ff-dev="firefox -P dev -no-remote"

# Dependent on environment
case ${OSTYPE} in
  linux*)
    alias ls="ls --color"
    alias la="ls -a"
    alias ll="ls -l"
    ;;
  darwin*)
    alias ls="ls -G"
    alias la="ls -aG"
    alias ll="ls -lG"
    ;;
  CYGWIN*)
    alias ls="ls --color"
    alias la="ls -a"
    alias ll="ls -l"
    alias ac="acrobat"
    alias wd="WINWORD"
	alias xl="EXCEL"
	alias pp="POWERPNT"
	alias vc9="devenv"
	alias netstat="NETSTAT"
	alias windump="WinDump"
    alias -s pdf=ac
	alias -s doc=wd
	alias -s xls=xl
	alias -s ppt=pp
	alias -s pptx=pp
	alias -s sln=vc9
	alias -s vcproj=vc9
	alias -s txt=vim
    ;;
esac

# environment parameter
case $(uname) in
  Linux)
    #virtualenv for python
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Devel
    ;;
  CYGWIN*)
    ;;
esac


# import 'mine' settings if present
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

