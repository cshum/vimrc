#!/bin/sh

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "source $(pwd)/vimrc.vim" > ~/.vimrc
vim +PluginInstall

#Vim proc
cd ~/.vim/bundle/vimproc.vim
make

#YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

#TernForVim
cd ~/.vim/bundle/tern_for_vim
npm install

