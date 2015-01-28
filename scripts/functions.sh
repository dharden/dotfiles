commandexists() {
  command -v $1 >/dev/null 2>&1
}

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
