#!/bin/bash

DOT_FILES=".vim .vimrc .tmux.conf .Xresources .bash_aliases .urxvt"


CURDIR=`basename \`pwd\``
set -ex
function link-dot-file(){
	for f in $DOT_FILES 
	do
		case $f in
			".Xresources")
				if [ -f /usr/bin/xrdb ]; then
					ln -snf $CURDIR/$f ${HOME}/$f
					/usr/bin/xrdb -remove
					/usr/bin/xrdb -merge ~/.Xresources
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

