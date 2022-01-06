#!/bin/bash

if [ -f ~/.vim ] || [ -L ~/.vim ]
then
    mv -f ~/.vim ~/.vim_bak
fi
ln -s `pwd` ~/.vim

if [ -L ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc_bak
fi

echo "so ~/.vim/init.vim" > ~/.vimrc
