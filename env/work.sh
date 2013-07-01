#!/bin/bash

# Work Stuff
alias vim='mvim -v'
alias template_cache='rm -f /workspace/drupal/tmp/cache/remote_template/*'
alias dp='cd ~/workspace/drupal'
alias dpthemes='cd ~/workspace/drupal/sites/all/themes'
alias dpcontemplates='cd ~/workspace/drupal/sites/all/contemplates'
alias dpmodules='cd ~/workspace/drupal/sites/all/modules'
alias dpsites='cd ~/workspace/drupal/sites'
source ~/fez-scripts/fez-scripts.bashrc
alias zfcurl='curl -I -v -H "x-zfc-debug:on"'
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export EC2_HOME=~/.aws/ec2-api-tools-1.6.7.1
export ANT_OPTS='-Dhappytrails.root=$HOME/ws/ht3 -Xmx500M'
export PATH=/Applications/MAMP/Library/bin/:/Users/dharden/.rbenv/bin:/Users/dharden/.rbenv/shims:$PATH:$EC2_HOME/bin:~/.aws/AWS-ElasticBeanstalk-CLI-2.3.1/eb/macosx/python2.7:/usr/local/share/npm/bin
launchctl setenv ANT_OPTS "$ANT_OPTS"
source ~/.secrets
eval "$(rbenv init -)"
alias zfcdebug="curl -I -H 'X-ZFC-debug:true'"
source ~/fez-scripts/fez-scripts.bashrc
