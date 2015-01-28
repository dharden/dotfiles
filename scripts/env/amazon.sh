# Customize to your needs...
export PATH=$PATH:/apollo/env/eclipse-3.7/bin:/home/hardend/bin:/home/hardend/usr/bin:/apollo/env/SDETools/bin:/apollo/env/envImprovement/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11R6/bin:/usr/X11/bin:/apollo/bin:/usr/kerberos/bin:/opt/third-party/bin:/opt/third-party/sbin
alias apollostatus="watch -t 'ls -drt /apollo/var/logs/apollo-update* | xargs tail | strings | fold -w $COLUMNS | tail -n $LINES'"
alias z="cd /workplace/hardend/MySweetSimpleStack/src/"
alias br='/apollo/env/SDETools/bin/brazil-runtime-exec'
alias yolo='git commit -am "DEAL WITH IT"; git push -f origin mainline; open http://31.media.tumblr.com/tumblr_m1hnnbSunI1qf5re0o1_400.gif'
function op_config() {
  local section=$1
  local key=$2
  cat $ENVIRONMENT_ROOT/Apollo/Manifest | awk "
  BEGIN{ found=0 }
  /^OCF.${section}:\$/{ getline; found=1 }
  /^\$/{ found=0 }
  { if (found) print }
  " | grep -Po '(?<=\s'"$key"' = ")[^"]*'
}

alias brazil-third-party-tool="/apollo/env/BrazilThirdPartyTool/bin/brazil-third-party-tool"

# ensure kerberos
ensure_kerberos() {
    klist -s || kinit -f
}

precmd() {
    ensure_kerberos
}
