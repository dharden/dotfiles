#!/bin/bash
source /apollo/env/envImprovement/var/zshrc
export PATH=/apollo/env/envImprovement/jdk/bin:/apollo/env/eclipse-3.7/bin:$PATH
alias vim=/usr/bin/vim
# ensure kerberos
ensure_kerberos() {
    klist -s || kinit -f
}

precmd() {
    ensure_kerberos
}
