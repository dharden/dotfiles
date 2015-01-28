export PATH=$PATH:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin
export EDITOR='vi'
# The colors, Duke, the colors!
export GREP_COLOR='1;35'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
git config --global color.ui true
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
