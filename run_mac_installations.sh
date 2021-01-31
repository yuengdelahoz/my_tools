#! /bin/sh
#
# run_installations.sh
# Copyright (C) 2018 yueng.delahoz <yueng.delahoz@lms-02-prod-us-e1>
#
# Distributed under terms of the MIT license.
#

# Homebrew
echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Wget
echo "Installing wget"
brew install wget

# iTerm
echo "Installing iTerm"
brew cask install iterm2

#Bash
echo "Installing and Setting up Bash"
brew install bash
# change brew bash as default shell
if [ ! -f /etc/shells.old ]; then
    sudo cp /etc/shells /etc/shells.old
    sudo echo /usr/local/bin/bash >> /etc/shells
    chsh -s /usr/local/bin/bash
fi

# Vim
echo "Installing VIM"
brew install vim

# Python 3
echo "Installing python 3"
brew install python3


