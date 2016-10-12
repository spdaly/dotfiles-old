#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Transmission\n\n"

execute "defaults write org.m0k.transmission DeleteOriginalTorrent -bool true" \
    "Delete the original torrent files"

execute "defaults write org.m0k.transmission DownloadAsk -bool false" \
    "Don’t prompt for confirmation before downloading"

execute "defaults write org.m0k.transmission MagnetOpenAsk -bool false" \
    "Don’t prompt for confirmation before downloading for magnet links"

execute "defaults write org.m0k.transmission DownloadChoice -string 'Constant' && \
         defaults write org.m0k.transmission DownloadFolder -string '$HOME/Downloads'" \
    "Use '~/Downloads' to store complete downloads"

execute "defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true && \
         defaults write org.m0k.transmission IncompleteDownloadFolder -string '$HOME/Downloads/torrents'" \
    "Use '~/Downloads/torrents' to store incomplete downloads"

execute "defaults write org.m0k.transmission WarningDonate -bool false" \
    "Hide the donate message"

execute "defaults write org.m0k.transmission WarningLegal -bool false" \
    "Hide the legal disclaimer"

# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
execute "defaults write org.m0k.transmission BlocklistNew -bool true && \
    defaults write org.m0k.transmission BlocklistURL -string 'http://john.bitsurge.net/public/biglist.p2p.gz' && \
    defaults write org.m0k.transmission BlocklistAutoUpdate -bool true" \
    "Set IP block list"

killall "Transmission" &> /dev/null
