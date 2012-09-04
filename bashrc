[[ -s "/home/madtrick/.rvm/scripts/rvm" ]] && source "/home/madtrick/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

[[ -d $HOME/repos/rebar ]] && export PATH=$PATH:$HOME/repos/rebar/
# Got at http://www.shell-fu.org/lister.php?id=375
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1  ;;
            *.tar.gz)    tar xvzf $1  ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xvf $1   ;;
            *.tbz2)      tar xvjf $1  ;;
            *.tgz)       tar xvzf $1  ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Make a directory and immediately 'cd' into it
mkcd() {
  mkdir -p "$*"
  cd "$*"
}


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

export PS1='\n[\u@\h \[\033[0m\]{\[\033[1;34m\] \W \[\033[0m\]}$( __git_ps1 " (\[\033[0;32m\]%s\[\033[0m\])") $(rvm-prompt i v p g) ]\n>>'

# This is a good place to source rvm v v v
export EDITOR=vim

if [ -r "$HOME/repos/todir/todir" ]
  then
    . "$HOME/repos/todir/todir"
    to_dir "rp" "$HOME/repos/"
fi

alias bex="bundle exec"
