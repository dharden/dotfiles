#!/bin/bash

# Work Stuff
alias zfcurl='curl -I -v -H "x-zfc-debug:on"'
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export PATH=/apollo/env/SDETools/bin:$PATH:/usr/local/share/npm/bin
launchctl load ~/Library/LaunchAgents/pbcopy.plist
