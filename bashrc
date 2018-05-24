##
## Find the dir where bashrc is stored
##
SOURCE="${BASH_SOURCE[0]}"
DOTFILES_DIR="$( dirname "$SOURCE" )"
# DOTFILES_DIR=~/repos/personal/dotfiles
while [ -h "$SOURCE" ]
do
 SOURCE="$(readlink "$SOURCE")"
 [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
 DOTFILES_DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd )"
done
DOTFILES_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source $DOTFILES_DIR/bash/bash.functions
source $DOTFILES_DIR/bash/bash.functions.contentful
source $DOTFILES_DIR/bash/bash.helpers
source $DOTFILES_DIR/bash/bash.env
source $DOTFILES_DIR/bash/bash.nvm
source $DOTFILES_DIR/bash/bash.alias
source $DOTFILES_DIR/bash/bash.rbenv
source $DOTFILES_DIR/bash/bash.plugins
source $DOTFILES_DIR/bash/bash.prompt
source $DOTFILES_DIR/bash/bash.tmux
source $DOTFILES_DIR/bash/bash.gpg
source $DOTFILES_DIR/bash/bash.options

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by travis gem
[ -f /Users/farruco/.travis/travis.sh ] && source /Users/farruco/.travis/travis.sh

# erlang version manager
[ -f /Users/farruco/.evm/scripts/evm ] && source /Users/farruco/.evm/scripts/evm

# Hook direnv https://direnv.net/
eval "$(direnv hook bash)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/farruco/repos/work/cfpat-audit/node_modules/tabtab/.completions/serverless.bash ] && . /Users/farruco/repos/work/cfpat-audit/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/farruco/repos/work/cfpat-audit/node_modules/tabtab/.completions/sls.bash ] && . /Users/farruco/repos/work/cfpat-audit/node_modules/tabtab/.completions/sls.bash
