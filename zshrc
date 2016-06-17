#                     __                     
#                    /\ \                    
#       ____     ____\ \ \___   _ __   ___   
#      /\_ ,`\  /',__\\ \  _ `\/\`'__\/'___\ 
#    __\/_/  /_/\__, `\\ \ \ \ \ \ \//\ \__/ 
#   /\_\ /\____\/\____/ \ \_\ \_\ \_\\ \____\
#   \/_/ \/____/\/___/   \/_/\/_/\/_/ \/____/

# ~/.zshrc: executed by zsh for non-login shells.

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nomatch
unsetopt beep extendedglob notify
bindkey -v
zstyle :compinstall filename '/home/svbtext/.zshrc'

# Prompt 
autoload -Uz colors && colors

PROMPT="%{$fg[red]%} »  %{$reset_color%}"
RPROMPT="%B%{$fg[black]%}%~%{$reset_color%}"

# Editor
export VISUAL="vim"
export EDITOR="vim"

# Aliases
alias editx='vim ~/.Xresources'
alias reload='xrdb ~/.Xresources'

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

alias tarx='tar -xvf'
alias targz='tar -zxvf'
alias tarbz2='tar -jxvf'
alias unrar='unrar x'

alias cp="cp -i"            # confirm before overwriting something
alias df='df -h'            # humna-readable sizes
alias free='free -m'        # show sizes in MB
alias cls='clear'

alias update='yaourt -Syu'
alias install='yaourt -S'
alias uninstall='yaourt -Rs'
alias search='yaourt -Ss'
alias show='yaourt -Si'
alias need='yaourt -Qi'
alias missing='yaourt -Qk'
alias trash='yaourt -Qdt'

alias fontupdate='fc-cache'

alias uguusel='uguush -s -o uguu'
alias uguuful='uguush -f -o uguu'

alias svbtext='toilet -k -f bloody --metal svbtext'

# Color man pages
man() {
     env \
         LESS_TERMCAP_mb=$(printf "\e[1;31m") \
         LESS_TERMCAP_md=$(printf "\e[1;31m") \
         LESS_TERMCAP_me=$(printf "\e[0m") \
         LESS_TERMCAP_se=$(printf "\e[0m") \
         LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
         LESS_TERMCAP_ue=$(printf "\e[0m") \
         LESS_TERMCAP_us=$(printf "\e[1;32m") \
             man "$@"
}

# ls after a cd
function cd()
{
 builtin cd "$*" && ls
}

autoload -Uz compinit
compinit
