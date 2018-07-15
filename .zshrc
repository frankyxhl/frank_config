# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira-no-ruby"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-autosuggestions docker-compose docker history history-substring-search mosh autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HISTSIZE=200000
# # number of lines saved in the history after logout
export SAVEHIST=200000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

# export NODE_PATH=/usr/local/lib/node_modules

[ -f .zshrc.d/common.sh ] && source .zshrc.d/common.sh
[ -f .zshrc.d/tar.sh ] && source .zshrc.d/tar.sh
[ -f .zshrc.d/search.sh ] && source .zshrc.d/search.sh
[ -f .zshrc.d/git.sh ] && source .zshrc.d/git.sh
[ -f .zshrc.d/docker.sh ] && source .zshrc.d/docker.sh
[ -f .zshrc.d/percol.sh ] && source .zshrc.d/percol.sh

# Custom each computer
[ -f ~/.zshrc.local.sh ] && source ~/.zshrc.local.sh

#turn of correct
unsetopt correct_all
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

if [[ `uname` == 'Darwin' ]]
then
    alias meld="open -W -a Meld --args "
    alias vim="/usr/local/Cellar/vim/8.0.0473/bin/vim"
    # For remacs purpose
    export PATH="/usr/local/opt/texinfo/bin:$PATH"
    if [[ -z "$LC_ALL" ]]; then
        export LC_ALL='en_US.UTF-8'
    fi
fi

# start zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ $HOST = 'MacbookPro.local' ] || [ $HOST = 'MacBook-Air' ]; then
    cmatrix -s
fi
