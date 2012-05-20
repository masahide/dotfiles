#!/bin/bash

DOT_FILES=".vim .vimrc"


CURDIR=`basename \`pwd\``
set -ex
function link-dot-file(){
	for f in $DOT_FILES 
	do
		ln -snf $CURDIR/$f ${HOME}/$f
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
  all|*)
	link-dot-file
	;;
esac

