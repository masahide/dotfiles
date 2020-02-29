#!/bin/bash
set -ex

# vim-bootstrap
curl -s 'https://vim-bootstrap.com/generate.vim' --data 'editor=vim' > vimfiles/.vimrc

dotfiles="
vimfiles/.vimrc 
vimfiles/.vimrc.local
vimfiles/.vimrc.local.bundles
.tmux.conf
"

for f in $dotfiles; do
    ln -sf dotfiles/$f ~/$(basename $f)
done


# vim
mkdir -p ~/.vim/backup ~/.vim/undo ~/.vim/tmp


# .bashrc
grep -q "^\. ~/dotfiles/\.bashrc$" ~/.bashrc || echo ". ~/dotfiles/.bashrc" >> ~/.bashrc

# .bash_profile
grep -q "^\. ~/dotfiles/\.bash_profile$" ~/.bash_profile || echo ". ~/dotfiles/.bash_profile" >> ~/.bash_profile
