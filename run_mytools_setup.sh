#! /bin/bash

install_dependencies(){
echo "Installing dependencies"
#sudo add-apt-repository ppa:jonathonf/vim
sudo apt purge vim cmake -y
sudo apt update
sudo apt install -y \
    build-essential \
    git \
    wget \
    screen \
    python3-dev \
    libncurses-dev \
    vim \
    tmux \
    curl \
    tree
    #snapd \

#sudo snap install cmake --classic
sudo -H pip3 install cmake
echo "Dependencies installed"
}

setup_tools(){
    #VIM
    echo "Setting up vim"
    ln -s $PWD/vim ~/.vim
    ln -s $PWD/vim/vimrc/vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    CC=gcc-8 CXX=g++-8 python3 ~/.vim/bundle/YouCompleteMe/install.py

    #INPUTRC
    echo "Setting up inputrc"
    ln -s $PWD/inputrc/inputrc ~/.inputrc

    # SCREENRC
    echo "Setting up screenrc"
    ln -s $PWD/screenrc/screenrc ~/.screenrc

    # BASH
    echo "Setting up bash"
    ln -s $PWD/bash/bash_profile ~/.bash_profile
    ln -s $PWD/bash/bash_aliases ~/.bash_aliases
    touch ~/.my_tools_OK
    echo "Tools are now configured"
}

delete_all(){
    echo "Deleting eveything in ~/.vim* ~/.inputrc ~/.screenrc vim/bundle"
    rm -rf ~/.vim*
    rm -rf ~/.inputrc
    rm -rf ~/.screenrc
    rm -rf ~/.bash_profile
    rm -rf ~/.my_tools_OK
}

flag=$1
if [ "$flag" = "--delete-all" ]; then
    delete_all
elif [ "$flag" = "--install" ]; then
    delete_all
    install_dependencies
    setup_tools
elif [ "$flag" = "--setup" ]; then
    if [ ! -f "$HOME/.my_tools_OK" ]; then
        setup_tools
    else
        echo "tools have already been installed. You can 1: run script with --delete-all to delete current configuration, and 2: run script with --install or --setup"
    fi
else
    echo "Available options:
        --delete-all : To delete current set up
        --install : to install and set up tools
        --setup" : to set up tools

fi

