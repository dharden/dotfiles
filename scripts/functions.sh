sshkeyify() {
  cat ~/.ssh/id_rsa.pub | ssh $1  "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"
}

remove_submodule() {
  if [ -d $1 ] ; then
    # Set pathdd_to_submodule var (no trailing slash):
    path_to_submodule=${1}
    # Delete the relevant line from the .gitmodules file:
    git config -f .gitmodules --remove-section submodule.$path_to_submodule
    # Delete the relevant section from .git/config
    git config -f .git/config --remove-section submodule.$path_to_submodule
    # Unstage and remove $path_to_submodule only from the index (to prevent losing information)
    git rm --cached $path_to_submodule
    # Track changes made to .gitmodules
    git add .gitmodules
    # Commit the superproject
    git commit -m "Remove submodule submodule_name"
    # Delete the now untracked submodule files
    rm -rf $path_to_submodule
    rm -rf .git/modules/$path_to_submodule
  else
    echo "'$1' is not a valid directory"
  fi
}

psgrep() { ps aux | grep -v grep | grep "$@" -i --color=auto; }

fname() { find . -iname "*$@*"; }

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

ff() {
  find . \! \( -type d \) -iname "*$1*"
}

fstr() {
  find . -type f -exec grep --color=auto -He "$1" {} \;
}

fstro() {
  vim -p $(find . -type f -exec grep --color=auto -lHe "$1" {} \;) -c "tabdo /$1"
}

colorize() {
  BASE16_DIR="$HOME/dotfiles/zsh/base16-shell"
  export BASE16_DIR;
  [[ -d $BASE16_DIR ]] && BASE16_SHELL=$(perl -MList::Util=shuffle -e 'print shuffle(`ls $ENV{BASE16_DIR}/scripts/*.sh`)' | head -n 1)
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
  echo -e "Switching to $(basename $BASE16_SHELL .sh)!"
}

getgit() {
  echo "$1" | sed -r 's/.*:.*\/(.*)\.git$/\1/'
}

vimpack() {
  if [ -d .vim ]; then
    DIR=$(getgit "$1")
    git submodule add "$1" ".vim/pack/plugins/start/$DIR"
  fi
}

testcolors() {
  for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
        printf "\n";
    fi
	done
}
