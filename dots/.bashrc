# vi mode
set -o vi

function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }

prompt_black='\[\e[30m\]'
prompt_red='\[\e[31m\]'
prompt_green='\[\e[32m\]'
prompt_yellow='\[\e[33m\]'
prompt_blue='\[\e[34m\]'
prompt_magenta='\[\e[35m\]'
prompt_cyan='\[\e[36m\]'
prompt_white='\[\e[37m\]'
prompt_default_color='\[\e[0m\]'
prompt_orange=`EXT_COLOR 172`

function parse_git_branch { 
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1  /' 
} 

export PS1="$prompt_magenta\u$prompt_cyan@$prompt_orange\h$prompt_red:$prompt_cyan\w$prompt_red|$prompt_green\$(parse_git_branch)$prompt_cyan$  $prompt_default_color"

#various alises and such
source $HOME/dotfiles/scripts/main.sh
bind '"\C-w":"colorize\n"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
