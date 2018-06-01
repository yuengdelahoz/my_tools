#! /bin/sh
#
# install.sh
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
else
    echo "Running script without flag --delete-all"
fi

#VIM
#Install plugins
ln -s my_tools/vim ~/.vim
ln -s .vim/vimrc/vimrc .vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#INPUTRC
ln -s my_tools/inputrc/inputrc .inputrc

# SCREENRC
ln -s my_tools/screenrc/screenrc .screenrc


