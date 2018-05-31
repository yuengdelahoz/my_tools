#! /bin/sh
#
# install.sh
# Copyright (C) 2018 yueng.delahoz <yueng.delahoz@lms-02-prod-us-e1>
#
# Distributed under terms of the MIT license.
#

#VIM
#Install Plugin manager
cd ~
ln -s my_tools/vim ~/.vim
ln -s .vim/vimrc/vimrc .vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#INPUTRC
ln -s my_tools/inputrc/inputrc .inputrc

# SCREENRC
ln -s my_tools/screenrc/screenrc .screenrc


