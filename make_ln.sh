#!/bin/bash

DOT_FILES=".vim .vimrc .tmux.conf .bash_aliases"


CURDIR=`basename \`pwd\``
set -ex
function link-dot-file(){
	for f in $DOT_FILES 
	do
		case $f in
			*)
				ln -snf $CURDIR/$f ${HOME}/$f
				;;
		esac
	done
}

function unlink-dot-file(){
	for f in $DOT_FILES 
	do
		if [ -L ${HOME}/$f ]; then
			rm ${HOME}/$f
		fi
	done
}


case "$1" in
  clean)
	unlink-dot-file
	;;
  git_submodule)
	git submodule update --init
	;;
  all|*)
	link-dot-file
	git submodule update --init
	;;
esac

