# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Applications/MAMP/Library/bin/
bindkey -v
alias template_cache='rm -f /workspace/drupal/tmp/cache/remote_template/*'
alias dp='cd ~/workspace/drupal'
alias dpthemes='cd ~/workspace/drupal/sites/all/themes'
alias dpcontemplates='cd ~/workspace/drupal/sites/all/contemplates'
alias dpmodules='cd ~/workspace/drupal/sites/all/modules'
alias dpsites='cd ~/workspace/drupal/sites'

# Commit Current Branch
function ccb {
head=$(git rev-parse --abbrev-ref HEAD)
message="$head $1"
git commit -m "$message"
git log -1 --format="%H" | pbcopy
}

function sshkeyify {
cat ~/.ssh/id_rsa.pub | ssh $1  "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"
}

export EDITOR='vim'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

source ~/fez-scripts/fez-scripts.bashrc
