# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HISTSIZE=100000
# # number of lines saved in the history after logout
export SAVEHIST=100000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

alias sub='ls -d */'
alias l.='ls -d .*'
alias h='history'
alias tar_delete='tar --delete -f '
alias tar_list='tar tf '
alias tar_update='tar uPvf '
alias tar_extract='tar xPvf '
# cp /usr/share/vim/vim{version}/macros/less.sh /usr/local/bin/vless
alias v='/usr/local/bin/vless'
alias c='rsync -av --progress'
alias ut='ubuntu-server-tip'
alias g='grep'

#turn of correct
unsetopt correct_all



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [ "`uname`"=="Darwin" ];
then
		alias emacs='open -a /Applications/Emacs.app $1'
		alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c'
else
		alias e='emacsclient -c -a ""'
fi
