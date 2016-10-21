#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_apps() {

    brew_install "Chrome" "google-chrome" "caskroom/cask" "cask"
    brew_install "Chrome Canary" "google-chrome-canary" "caskroom/versions" "cask"
    brew_install "Firefox" "firefox" "caskroom/cask" "cask"
    brew_install "Firefox Developer" "firefoxdeveloperedition" "caskroom/versions" "cask"
    brew_install "Git" "git"
    brew_install "GPG" "gpg"
    brew_install "GPG Agent" "gpg-agent"
    brew_install "Pinentry" "pinentry-mac"
    brew_install "ImageAlpha" "imagealpha" "caskroom/cask" "cask"
    brew_install "ImageMagick" "imagemagick --with-webp"
    brew_install "ImageOptim" "imageoptim" "caskroom/cask" "cask"
    brew_install "LICEcap" "licecap" "caskroom/cask" "cask"
    brew_install "ShellCheck" "shellcheck"
    brew_install "tmux" "tmux"
    brew_install "tmux (pasteboard)" "reattach-to-user-namespace"
    brew_install "Transmission" "transmission" "caskroom/cask" "cask"
    brew_install "Unarchiver" "the-unarchiver" "caskroom/cask" "cask"
    brew_install "Vim" "vim --with-override-system-vi"
    brew_install "VirtualBox" "virtualbox" "caskroom/cask" "cask"
    brew_install "VLC" "vlc" "caskroom/cask" "cask"
    brew_install "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "bramstein/webfonttools"
    brew_install "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "bramstein/webfonttools"
    brew_install "Web Font Tools: WOFF2" "woff2" "bramstein/webfonttools"
    brew_install "Zopfli" "zopfli"
    brew_install "Flash" "flash-player" "caskroom/cask" "cask"
    brew_install "Googler" "googler"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Miscellaneous\n\n"

    install_apps
    printf "\n"
    brew_cleanup

}

main
