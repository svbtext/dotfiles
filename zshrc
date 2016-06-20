#                     __                     
#                    /\ \                    
#       ____     ____\ \ \___   _ __   ___   
#      /\_ ,`\  /',__\\ \  _ `\/\`'__\/'___\ 
#    __\/_/  /_/\__, `\\ \ \ \ \ \ \//\ \__/ 
#   /\_\ /\____\/\____/ \ \_\ \_\ \_\\ \____\
#   \/_/ \/____/\/___/   \/_/\/_/\/_/ \/____/

# ~/.zshrc: executed by zsh for non-login shells.

export SHELL='/bin/zsh'
export EDITOR='vim'
export VIEW='firefox'
export COLORTERM="YES"

bindkey -v
zstyle :compinstall filename '/home/svbtext/.zshrc'

# Source config files
for r in $HOME/etc/zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
        echo "zsh: sourcing $r"
    fi
    source $r
done

# Source plugins
# for r in $HOME/etc/zsh/plugins/*.zsh; do
#    if [[ $DEBUG > 0 ]]; then
#        echo "zsh: sourcing $r"
#    fi
#    source $r
# done

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
