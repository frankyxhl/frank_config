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
plugins=(git zsh-autosuggestions docker-compose docker history history-substring-search mosh)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HISTSIZE=200000
# # number of lines saved in the history after logout
export SAVEHIST=200000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

export NODE_PATH=/usr/local/lib/node_modules

alias sub='ls -d */'
alias l.='ls -d .*'
alias h='history'
alias tar_delete='tar --delete -f '
alias tar_list='tar tf '
alias tar_update='tar uPvf '
alias tar_extract='tar xPvf '
alias tar_package='tar -zcvf '
# cp /usr/share/vim/vim{version}/macros/less.sh /usr/local/bin/vless
alias v='/usr/local/bin/vless'
# alias c='rsync -av --progress'
alias ut='ubuntu-server-tip'
alias g='grep'
# alias gr='grunt'
alias rsync_remote_file="rsync $1 . -avz --progress"
#pip install youtube-dl
alias ytb="youtube-dl $1 -f 37/22/35/34"
alias size='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias mytree="tree -FAC | less -r"
ailas capslock_to_ctrl='setxkbmap -layout us -option ctrl:nocaps'
mvbk() {
    mv $1 $1.bak
}
cpbk() {
    cp $1 $1.bak
}
alias mvbk=mvbk
alias cpbk=cpbk

#turn of correct
unsetopt correct_all

cmatrix -s

PATH=$PATH:$HOME/.rvm/bin:$HOME/bin # Add RVM to PATH for scripting
# if [ "`uname`"=="Darwin" ];
# then
# alias emacs='open -a /Applications/Emacs.app $1'
# alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# else
# alias e='emacsclient -c -a ""'
# alias e='emacsclient -t'
# alias ec='emacsclient -c'
# fi

# Load zsh-syntax-highlighting.
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Setup zsh-autosuggestions
#source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
#zle-line-init() {
#    zle autosuggest-start
#}

#zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
    local tac
    exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
    BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
}

zle -N percol_select_history
bindkey '^R' percol_select_history
fi

if [[ `uname` == 'Darwin' ]]
then
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
    export PATH=${PATH}:~/Development/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:~/platform-tools:~/Development/adt-bundle-mac-x86_64-20131030/sdk/tools
    export JAVA_HOME=$(/usr/libexec/java_home)
    export GOPATH=~/mygo				
    export WORKON_HOME=~/bitbucket
    source /usr/local/bin/virtualenvwrapper.sh
    alias goto_sdcard="cd /Volumes/Transcend"
    export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
    export PATH="/Users/frank/.composer/vendor/bin:$PATH"
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
fi

# start zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-containers
alias rm_docker_not_running_containers='docker rm $(docker ps -q -f status=exited)'


alias rm_docker_untagged_images='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
# Use `docker-cleanup --dry-run` to see what would be deleted.

function docker-cleanup {
  EXITED=$(docker ps -q -f status=exited)
  DANGLING=$(docker images -q -f "dangling=true")

  if [ "$1" == "--dry-run" ]; then
    echo "==> Would stop containers:"
    echo $EXITED
    echo "==> And images:"
    echo $DANGLING
  else
    if [ -n "$EXITED" ]; then
        docker rm $EXITED
    else
        echo "No containers to remove."
    fi
    if [ -n "$DANGLING" ]; then
        docker rmi $DANGLING
    else
        echo "No images to remove."
    fi
  fi
}
