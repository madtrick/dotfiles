export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

export PS1='\n[\u@\h \[\033[0m\]{\[\033[1;34m\] \W \[\033[0m\]}$( __git_ps1 " (\[\033[0;32m\]%s\[\033[0m\])") $(rvm-prompt i v p g) ]\n>>'

# This is a good place to source rvm v v v
[[ -s "/home/madtrick/.rvm/scripts/rvm" ]] && source "/home/madtrick/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
export EDITOR=vim

if [ -r "$HOME/repos/todir/todir" ]
  then
    . "$HOME/repos/todir/todir"
    to_dir "rp" "$HOME/repos"
fi
