# Ushell configuration

# Prompt
autoload colors
colors

case ${UID} in
0)
	PROMPT="%B%{${fg[red]}%}%m%b%{${fg[blue]}@%}%/#%{${reset_color}%}"
	PROMPT2="%{${fg[blue]}%}%_#%{${reset_color}%}"
	SPROMPT="%B%{${fg[red]%}%r%{${reset_color}%} is correct? [n,y,a,e]:%b"
	;;
*)
	PROMPT="%{${fg[green]}%}%n%{${fg[blue]}@%}%~#%{${reset_color}%}"
	PROMPT2="%{${fg[blue]}%}%_#%{${reset_color}%}"
	SPROMPT="%B%{${fg[red]%}%r%{${reset_color}%} is correct? [n,y,a,e]:%b"
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

# Directory change
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

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
PATH=$PATH:~/bin/firefox

# Aliases
setopt complete_aliases
alias ls="ls --color"
alias la="ls -a"
alias ll="ls -l"
alias df="df -h"
alias ff-dev="firefox -P dev -no-remote"

# import 'mine' settings if present
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

