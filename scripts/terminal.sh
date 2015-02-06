BASE16_DIR="$HOME/dotfiles/zsh/base16-shell"
export BASE16_DIR;
[[ -d $BASE16_DIR ]] && BASE16_SHELL=$(perl -MList::Util=shuffle -e 'print shuffle(`ls $ENV{BASE16_DIR}/*dark.sh`)' | head -n 1)
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
