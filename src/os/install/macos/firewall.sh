#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

config_gatekeeper() {
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add "/usr/sbin/rpcbind"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp "/usr/sbin/rpcbind"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add "/sbin/nfsd"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp "/sbin/nfsd"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add "/usr/sbin/rpc.statd"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp "/usr/sbin/rpc.statd"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add "/usr/sbin/rpc.lockd"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp "/usr/sbin/rpc.lockd"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add "/usr/libexec/rpc.rquotad"
    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp "/usr/libexec/rpc.rquotad"
    sudo nfsd restart
}

main() {
    print_in_purple "\n   Firewall/Gatekeeper Settings\n\n"
    config_gatekeeper
    printf "\n"
}

main
