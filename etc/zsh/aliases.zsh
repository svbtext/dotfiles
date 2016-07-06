#			        ___                                             
#			       /\_ \    __                                      
#			   __  \//\ \  /\_\      __       ____     __     ____  
#			 /'__`\  \ \ \ \/\ \   /'__`\    /',__\  /'__`\  /',__\ 
#			/\ \L\.\_ \_\ \_\ \ \ /\ \L\.\_ /\__, `\/\  __/ /\__, `\
#			\ \__/.\_\/\____\\ \_\\ \__/.\_\\/\____/\ \____\\/\____/
#			 \/__/\/_/\/____/ \/_/ \/__/\/_/ \/___/  \/____/ \/___/ 

# 		svbtext - https://www.github.com/svbtext/dotfiles

# List all aliases in alphabetical order
alias al='alias | less'

# Edit config files
alias vx='vim ~/.Xresources'
alias vp='cd ~/.config/bspwm/panel'
alias vb='vim ~/.config/bspwm/bspwmrc'
alias vs='vim ~/.config/sxhkd/sxhkdrc'
alias vz='vim ~/.zshrc'
alias va='vim ~/etc/zsh/aliases.zsh'
alias vv='vim ~/.vimrc'
alias rl='xrdb ~/.Xresources'

# Colored LS
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

# Unarchiving
alias tarx='tar -xvf'
alias targz='tar -zxvf'
alias tarbz2='tar -jxvf'
alias unrar='unrar x'

alias cp="cp -i"                    # confirm before overwriting something
alias df='df -h'                    # humna-readable sizes
alias free='free -m'                # show sizes in MB
alias cls='clear'
alias ping='ping -c 4'
alias backup='cp filename{,.bak}'
alias rmf='rm -R'                   # remove directory
alias upload='uguush -o uguu -u'

# Yaourt
alias update='yaourt -Syu'
alias install='yaourt -S'
alias uninstall='yaourt -Rs'
alias search='yaourt -Ss'
alias show='yaourt -Si'
alias need='yaourt -Qi'
alias missing='yaourt -Qk'
alias trash='yaourt -Qdt'
 
# Git
alias g='git'
alias ga='git add'
alias gr='git rm'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -m'
alias gca='git commit -v -a'
alias gct='git commit --dry-run'

# Shortcuts for running things
alias fontrl='fc-cache'
alias nc='mpc update && cls && ncmpcpp'	# update library and launch ncmpcpp
alias ufetch='ufetch-arch'
alias exe='chmod +x'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
alias fm='ranger'

# Screenshots
alias uguusel='uguush -s -o uguu'
alias uguuful='uguush -f -o uguu'
alias maim='maim ~/pic/scrot/$(date +%F-%T).png'

alias clock='tty-clock -c -t -b -B'

# Changing dirs with just dots
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
 
# Shortcuts to commonly used dirs
alias home='cd ~'
alias wps='ranger ~/pic/wallpapers'
alias scrnsht='ranger ~/pic/scrot'
alias prn='ranger ~/pic/porn'

alias weather='sh ~/proj/rss.sh http://www.rssweather.com/wx/us/az/glendale/rss.php 1 1 && sh ~/proj/rss.sh http://www.rssweather.com/wx/us/ca/san%20diego/rss.php 1 1 && sh ~/proj/rss.sh http://www.rssweather.com/wx/us/ny/new%20york/rss.php 1 1'

# Honestly who cares
alias svb1='toilet -f rusto svbtext | lolcat'
alias svb2='toilet -f bloody svbtext | lolcat'
alias svb3='toilet -f larry3d svbtext | lolcat'
