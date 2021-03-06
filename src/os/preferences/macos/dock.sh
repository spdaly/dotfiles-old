#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dock\n\n"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

execute "defaults write com.apple.Dock autohide-delay -float 0" \
    "Remove autohide delay"

execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

execute "defaults write com.apple.dock expose-animation-duration -float 0.12" \
    "Speed up Mission Control animations"

execute "defaults write com.apple.dock expose-group-by-app -bool false" \
    "Do not group windows by application in Mission Control"

execute "defaults write com.apple.dock mineffect -string 'genie'" \
    "Change minimize/maximize window effect"

execute "defaults write com.apple.dock minimize-to-application -bool true" \
    "Reduce clutter by minimizing windows into their application icons"

execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock persistent-apps -array && \
         defaults write com.apple.dock persistent-others -array " \
    "Wipe all app icons"

execute "defaults write com.apple.dock show-process-indicators -bool true" \
    "Show indicator lights for open applications"

execute "defaults write com.apple.dock showhidden -bool true" \
    "Make icons of hidden applications translucent"

execute "defaults write com.apple.dock tilesize -int 40" \
    "Set icon size"

execute "defaults write com.apple.dock magnification -int 1" \
    "Set highlight magnification"

execute "defaults write com.apple.dock static-only -bool TRUE" \
    "Display only active application in the Mac OS X Dock"

killall "Dock" &> /dev/null
