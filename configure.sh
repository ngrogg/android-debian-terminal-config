#!/usr/bin/bash

# Android Debian Configure
# BASH script to configure Debian Android Terminal
# By Nicholas Grogg

# Color variables
## Errors
red=$(tput setaf 1)
## Clear checks
green=$(tput setaf 2)
## User input required
yellow=$(tput setaf 3)
## Set text back to standard terminal font
normal=$(tput sgr0)

# Help function
function helpFunction(){
    printf "%s\n" \
    "Help" \
    "----------------------------------------------------" \
    " " \
    "help/Help" \
    "* Display this help message and exit" \
    " "
    "configure/Configure" \
    "* Install packages and put config files in place" \
    "Usage, just run the script"
}

# Function to run program
function runProgram(){
    printf "%s\n" \
    "Configure" \
    "----------------------------------------------------"

    ## Install packages
    sudo apt install -y \
        bind9-dnsutils \
        g++ \
        git \
        htop \
        links \
        net-tools \
        python-is-python3 \
        python3 \
        python3-dev \
        ranger \
        tmux \
        vim-nox \
        whois \
        wireshark \
        zsh

    ## Clone repo, use HTTPS so an SSH key is not needed
    git clone https://github.com/ngrogg/android-debian-terminal-config.git

    ## Put config files in place
    cp android-debian-terminal-config/files/.tmux.conf ~/.tmux.conf
    cp android-debian-terminal-config/files/.vimrc ~/.vimrc
    cp android-debian-terminal-config/files/.zshrc ~/.zshrc

    ## System config changes
    ### Create zsh files
    mkdir -p ~/.zsh/cache

    ### Create directory for git repos
    mkdir -p ~/Documents/gits

    ### Set droid user password, required to change shell to ZSH
    sudo passwd droid

    ### Change shell to zsh
    chsh -s $(which zsh)

    ### Generate an SSH key
    ssh-keygen -t ed25519 -C "$(hostname) key"

    ## Remove https cloned git repo
    rm -rf android-debian-terminal-config

}

# Main, read passed flags
printf "%s\n" \
"Android Debian Configure" \
"----------------------------------------------------" \
" " \
"Checking flags passed" \
"----------------------------------------------------"

# Check passed flags
case "$1" in
[Hh]elp)
    printf "%s\n" \
    "Running Help function" \
    "----------------------------------------------------"
    helpFunction
    exit
    ;;
[Cc]onfigure)
    printf "%s\n" \
    "Running script" \
    "----------------------------------------------------"
    runProgram
    ;;
*)
    printf "%s\n" \
    "${red}ISSUE DETECTED - Invalid input detected!" \
    "----------------------------------------------------" \
    "Running help script and exiting." \
    "Re-run script with valid input${normal}"
    helpFunction
    exit
    ;;
esac
