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

source $DOTFILES_DIR/bash.env
source $DOTFILES_DIR/bash.alias
source $DOTFILES_DIR/bash.prompt
source $DOTFILES_DIR/bash.functions
source $DOTFILES_DIR/bash.rvm
source $DOTFILES_DIR/bash.plugins
