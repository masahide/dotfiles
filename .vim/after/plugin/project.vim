if getcwd() != $HOME
	if expand("%") != '.git/COMMIT_EDITMSG'
		if filereadable(getcwd(). '/.vimprojects')
			Project .vimprojects
		endif
	endif
endif
