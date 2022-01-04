#!/bin/bash

# install global
if [ ! -f /usr/local/bin/gtags ] && [ ! -f /usr/bin/gtags ]
then
    cd global
    configure
    make && make install
    cd -
fi

if [ ! -f ~/.vim ]
then
    mv ~/.vim ~/.vim_bak
    ln -s `pwd` ~/.vim
fi

if [ -L ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc_bak
fi

echo "so ~/.vim/init.vim" > ~/.vimrc
