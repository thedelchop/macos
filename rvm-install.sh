#!/usr/bin/env bash
#
# File:         rvm-install.sh
# Description:  This script bootstraps rvm, Ruby, bundler and any defined gems in a Ruby project directory.
#

echo "Installing the latest stable version of RVM"
curl -L https://get.rvm.io | bash -s stable --autolibs=enable --ignore-dotfiles
source "$HOME/.rvm/scripts/rvm"
