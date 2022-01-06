#!/bin/bash

if [ -f ~/.vim ]
then
    mv ~/.vim ~/.vim_bak
fi
ln -s `pwd` ~/.vim

if [ -L ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc_bak
fi

echo "so ~/.vim/init.vim" > ~/.vimrc
