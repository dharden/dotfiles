# ignore unused variables
# shellcheck disable=SC2034
# vi mode
set -o vi

function EXT_COLOR () { echo -ne "\\[\\033[38;5;$1m\\]"; }

prompt_black='\[\e[30m\]'
prompt_red='\[\e[31m\]'
prompt_green='\[\e[32m\]'
prompt_yellow='\[\e[33m\]'
prompt_blue='\[\e[34m\]'
prompt_magenta='\[\e[35m\]'
prompt_cyan='\[\e[36m\]'
prompt_white='\[\e[37m\]'
prompt_default_color='\[\e[0m\]'
prompt_orange=$(EXT_COLOR 172)

function parse_git_branch { 
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1  /' 
}

PS1="$prompt_magenta\\u$prompt_cyan@$prompt_orange\\h$prompt_red:$prompt_cyan\\w$prompt_red|$prompt_green$(parse_git_branch)$prompt_cyan$  $prompt_default_color"
export PS1

#various alises and such
# shellcheck source=./../scripts/main.sh
source "$HOME/dotfiles/scripts/main.sh"
bind '"\C-w":"colorize\n"'
