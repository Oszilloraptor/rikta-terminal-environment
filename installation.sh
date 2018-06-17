#!/usr/bin/env bash

# install pip
function rte_install_pip() {
    sudo apt-get install python-pip python3-dev python3-pip
}

function rte_upgrade_node_to_latest_version() {
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n stable
}

# corrects the last command
function rte_install_thefuck() {
    sudo pip3 install thefuck
}

# google
function rte_install_googler() {
    $ sudo curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v3.6/googler \
    && sudo chmod +x /usr/local/bin/googler
}

# translation
function rte_install_trino() {
    sudo npm install -g trino
}

# git-management
function rte_install_git_commander() {
    sudo npm install -g git-commander
}

# install doctoc, a "table of content"-generator for markdown files
# https://github.com/thlorenz/doctoc
function rte_install_doctoc() {
    sudo npm i -g doctoc
}

# install howdoi() 
function rte_install_howdoi() {
    pip install howdoi
}

# install alder, a better tree-command
function rte_install_alder() {
    sudo npm install -g @aweary/alder
}
