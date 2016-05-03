##
## Find the dir where bashrc is stored
##
SOURCE="${BASH_SOURCE[0]}"
DOTFILES_DIR="$( dirname "$SOURCE" )"
while [ -h "$SOURCE" ]
do
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  DOTFILES_DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd )"
done
DOTFILES_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source $DOTFILES_DIR/bash/bash.functions
source $DOTFILES_DIR/bash/bash.helpers
source $DOTFILES_DIR/bash/bash.env
source $DOTFILES_DIR/bash/bash.nvm
source $DOTFILES_DIR/bash/bash.alias
source $DOTFILES_DIR/bash/bash.rbenv
source $DOTFILES_DIR/bash/bash.plugins
source $DOTFILES_DIR/bash/bash.prompt
source $DOTFILES_DIR/bash/bash.tmux
source $DOTFILES_DIR/bash/bash.gpg

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by travis gem
[ -f /Users/farruco/.travis/travis.sh ] && source /Users/farruco/.travis/travis.sh
