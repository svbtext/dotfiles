#			               __     __                                     
#			              /\ \__ /\ \__  __                              
#			  ____     __ \ \ ,_\\ \ ,_\/\_\     ___       __      ____  
#			 /',__\  /'__`\\ \ \/ \ \ \/\/\ \  /' _ `\   /'_ `\   /',__\ 
#			/\__, `\/\  __/ \ \ \_ \ \ \_\ \ \ /\ \/\ \ /\ \L\ \ /\__, `\
#			\/\____/\ \____\ \ \__\ \ \__\\ \_\\ \_\ \_\\ \____ \\/\____/
#			 \/___/  \/____/  \/__/  \/__/ \/_/ \/_/\/_/ \/___L\ \\/___/ 
#			                                               /\____/       
#			                                               \_/__/     

#			svbtext - https://www.github.com/svbtext/dotfiles

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt appendhistory autocd nomatch
unsetopt beep extendedglob notify
autoload -Uz compinit
compinit

# show waiting dots for tab completion
expand-or-complete-with-dots() {
    echo -n "\e[31m......\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# print current process in term titlebar
if [ "$SHELL" = '/usr/bin/zsh' ]
then
    case $TERM in
        rxvt|*term)
        precmd() { print -Pn "\e]0;%m:%~\a" }
        preexec () { print -Pn "\e]0;$1\a" }
        ;;
    esac
fi
