#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
   "Avoid creating '.DS_Store' files on network volumes"

execute "defaults write com.apple.menuextra.battery ShowPercent -string 'NO'" \
    "Hide battery percentage from the menu bar"

execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    "Disable 'Are you sure you want to open this application?' dialog"

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

execute "defaults write com.apple.screencapture disable-shadow -bool true" \
    "Disable shadow in screenshots"

execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
    "Save screenshots to the Desktop"

execute "defaults write com.apple.screencapture type -string 'png'" \
    "Save screenshots as PNGs"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
    "Require password immediately after into sleep or screen saver mode"

execute "defaults write NSGlobalDomain AppleFontSmoothing -int 2" \
    "Enable subpixel font rendering on non-Apple LCDs"

execute "defaults write NSGlobalDomain AppleShowScrollBars -string 'WhenScrolling'" \
    "Show scrollbars while scrolling"

execute "defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

execute "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1" \
    "Set sidebar icon size to small"

execute "defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false" \
    "Disable the over-the-top focus ring animation"

execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

execute "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'steve' && \
         sudo scutil --set ComputerName 'steve' && \
         sudo scutil --set HostName 'steve' && \
         sudo scutil --set LocalHostName 'steve'" \
    "Set computer name"

execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

execute "sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState -int 1 && \
         sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist && \
         sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist" \
    "Turn Bluetooth on"

execute "sudo pmset -a standbydelay 86400" \
    "Set standby delay to 24 hours (default is 1 hour)"

execute "sudo nvram SystemAudioVolume=' '" \
    "Disable the sound effects on boot"

killall "SystemUIServer" &> /dev/null
