#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

print_in_purple "\n   Solid State Drive\n\n"

execute "sudo pmset -a hibernatemode 0" \
    "Disable hibernation (speeds up entering sleep mode)"

execute "sudo rm /private/var/vm/sleepimage" \
    "Remove the sleep image file to save disk space"

execute "sudo touch /private/var/vm/sleepimage" \
    "Create a zero-byte file instead…"

execute "sudo chflags uchg /private/var/vm/sleepimage" \
    "…and make sure it can’t be rewritten"

execute "sudo pmset -a sms 0" \
    "Disable the sudden motion sensor as it’s not useful for SSDs"
