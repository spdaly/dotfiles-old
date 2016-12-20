#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Finder\n\n"

execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false && \
         defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false && \
         defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool false" \
         "Do not open a new Finder window when a volume is mounted"

execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
    "Use full POSIX path as window title"

execute "defaults write com.apple.finder DisableAllAnimations -bool true" \
    "Disable all animations"

execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
    "Disable the warning before emptying the Trash"

execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
    "Search the current directory by default"

execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
    "Disable warning when changing a file extension"

# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
    "Use list view in all Finder windows by default"

execute "defaults write com.apple.finder NewWindowTarget -string 'PfDe' && \
         defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/Desktop/'" \
    "Set 'Desktop' as the default location for new Finder windows"

execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false && \
         defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false && \
         defaults write com.apple.finder ShowMountedServersOnDesktop -bool false && \
         defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false" \
    "Do not show icons for hard drives, servers, and removable media on the desktop"

execute "defaults write com.apple.finder ShowRecentTags -bool false" \
    "Do not show recent tags"

execute "defaults write -g AppleShowAllExtensions -bool true" \
    "Show all filename extensions"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 32' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:iconSize 32' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 100' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:gridSpacing 100' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon grid spacing size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 10' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 10' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label text size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label position"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:showItemInfo false' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:showItemInfo false' ~/Library/Preferences/com.apple.finder.plist" \
    "Show item info"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy name' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy name' ~/Library/Preferences/com.apple.finder.plist" \
    "Set sort method"

execute "defaults write com.apple.finder QLEnableTextSelection -bool true" \
    "Enable text selection in Quick Look windows"

execute "defaults write com.apple.finder AppleShowAllFiles -bool true" \
    "Always show hidden files"

execute "defaults write com.apple.finder CreateDesktop -bool false" \
    "Hide desktop icons"

execute "defaults write com.apple.finder ShowStatusBar -bool true" \
    "Show status bar"

execute "defaults write com.apple.finder ShowPathbar -bool true" \
    "Show path bar"

execute "defaults write com.apple.finder _FXSortFoldersFirst -bool true" \
    "Keep folders on top when sorting by name"

execute "defaults write NSGlobalDomain com.apple.springing.enabled -bool true" \
    "Enable spring loading for directories"

execute "defaults write NSGlobalDomain com.apple.springing.delay -float 0" \
    "Remove the spring loading delay for directories"

execute "defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true" \
    "Enable AirDrop over Ethernet and on unsupported Macs running Lion"

execute "chflags nohidden ~/Library" \
    "Show the ~/Library folder"

execute "sudo chflags nohidden /Volumes"  \
    "Show the /Volumes folder"

execute "defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true Privileges -bool true" \
    "Expand the following File Info panes: General, Open with, and Sharing & Permissions"

killall "Finder" &> /dev/null

# Starting with Mac OS X Mavericks preferences are cached,
# so in order for things to get properly set using `PlistBuddy`,
# the `cfprefsd` process also needs to be killed.
#
# https://github.com/alrra/dotfiles/commit/035dda057ddc6013ba21db3d2c30eeb51ba8f200

killall "cfprefsd" &> /dev/null
