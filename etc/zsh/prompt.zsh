#			                                           __      
#			                                          /\ \__   
#			 _____    _ __   ___     ___ ___    _____ \ \ ,_\  
#			/\ '__`\ /\`'__\/ __`\ /' __` __`\ /\ '__`\\ \ \/  
#			\ \ \L\ \\ \ \//\ \L\ \/\ \/\ \/\ \\ \ \L\ \\ \ \_ 
#			 \ \ ,__/ \ \_\\ \____/\ \_\ \_\ \_\\ \ ,__/ \ \__\
#			  \ \ \/   \/_/ \/___/  \/_/\/_/\/_/ \ \ \/   \/__/
#			   \ \_\                              \ \_\        
#			    \/_/                               \/_/        

#			svbtext - https://www.github.com/svbtext/dotfiles

autoload -Uz colors && colors

# Minimal prompt, with » on the left and current dir on the right
#PROMPT="%{$fg[red]%} »  %{$reset_color%}"
#RPROMPT="%B%{$fg[black]%}%~%{$reset_color%}"

# Powerline prompt, requires a patched font
PROMPT="%{$bg[cyan]%}%{$fg[black]%} %~ %{$bg[black]%}%{$fg[cyan]%}%{$bg[black]%}%{$reset_color%}%{$fg[white]%}%{$bg[black]%} %n %{$reset_color%}%{$fg[black]%}  %{$reset_color%}"
RPROMPT="%{$fg[red]%}%{$bg[red]%}%{$fg[black]%}%@ %{$reset_color%}"
