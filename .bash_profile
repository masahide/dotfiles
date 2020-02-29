
HISTSIZE=50000
export PATH=$PATH:$HOME/bin
export EDITOR=vim

case $(uname) in
    Darwin)
        if [[ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]]; then
          __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
          source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
        fi

        [[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion

        eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
        export LDFLAGS="-L/usr/local/opt/readline/lib"
        export CPPFLAGS="-I/usr/local/opt/readline/include"
        export CLICOLOR=1
        ;;
    Linux)
        
        ;;
esac
