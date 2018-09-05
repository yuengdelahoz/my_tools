#! /bin/sh
#
# run_mytools_setup.sh
# Copyright (C) 2018 yueng.delahoz <yueng.delahoz@lms-02-prod-us-e1>
#
# Distributed under terms of the MIT license.
#

cd ~
flag=$1
if [ "$flag" = "--delete-all" ]
then
    echo "Deleting eveything in ~/.vim* ~/.inputrc ~/.screenrc vim/bundle"
    rm -rf ~/.vim*
    rm -rf ~/.inputrc
    rm -rf ~/.screenrc
    rm -rf ~/.bash_profile
else
    echo "Running script without flag --delete-all"
fi

#VIM
echo "Setting up vim"
ln -s my_tools/vim ~/.vim
ln -s .vim/vimrc/vimrc .vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py

#INPUTRC
echo "Setting up inputrc"
ln -s my_tools/inputrc/inputrc .inputrc

# SCREENRC
echo "Setting up screenrc"
ln -s my_tools/screenrc/screenrc .screenrc

# BASH
echo "Setting up bash"
ln -s my_tools/bash/bash_profile bash_profile
ln -s my_tools/bash/bash_aliases bash_aliases
