#!/bin/bash

DOT_FILES=".vim .vimrc .tmux.conf .Xresources .bash_aliases"


CURDIR=`basename \`pwd\``
set -ex
function link-dot-file(){
	for f in $DOT_FILES 
	do
		case $f in
			".Xresources")
				if [ -L /usr/bin/xrdb ]; then
					/usr/bin/xrdb -remove
					/usr/bin/xrdb -merge ~/.xresources
					ln -snf $CURDIR/$f ${HOME}/$f
				fi
				;;
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
  all|*)
	link-dot-file
	;;
esac

