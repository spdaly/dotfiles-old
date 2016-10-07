#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_npm_package() {

    execute \
        ". $HOME/.bash.local \
            && npm install --global --silent $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   npm\n\n"

    install_npm_package "npm (update)" "npm"
    printf "\n"
    install_npm_package "Babel" "babel-cli"
    install_npm_package "JSHint" "jshint"
    install_npm_package "Git Open" "git-open"
    install_npm_package "Git Recent" "git-recent"
    install_npm_package "Fancy Diff" "diff-so-fancy"
    install_npm_package "Trash CLI" "trash-cli"
    

}

main
