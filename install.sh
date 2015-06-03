#!/bin/sh

set -e

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "source $PWD/vimrc.vim" >> ~/.vimrc
echo 'noremap <leader><leader> :lcd '$(dirname $PWD)'/' >> ~/.vimrc

#https://github.com/gmarik/Vundle.vim/issues/511
vim +PluginInstall +qall &>/dev/null

#YouCompleteMe
# cd ~/.vim/bundle/YouCompleteMe
# ./install.sh --clang-completer

#TernForVim
# cd ~/.vim/bundle/tern_for_vim
# npm install

