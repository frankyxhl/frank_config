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
plugins=(git zsh-autosuggestions docker-compose docker history history-substring-search mosh kubectl zsh-syntax-highlighting z)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HISTSIZE=2000000
# # number of lines saved in the history after logout
export SAVEHIST=2000000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

# export NODE_PATH=/usr/local/lib/node_modules

source ~/.zshrc.d/common.sh
source ~/.zshrc.d/search.sh
source ~/.zshrc.d/git.sh
source ~/.zshrc.d/docker.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom each computer
# If is Cygwin
# if [ "$(get_os_name)" = "Cygwin" ]; then
#     [ -f ~/.zshrc.d/windows.sh ] && source ~/.zshrc.d/windows.sh
# fi

case  $(get_os_name) in
    Cygwin) [ -f ~/.zshrc.d/windows.sh ] && source ~/.zshrc.d/windows.sh;;
    Mac) [ -f ~/.zshrc.d/macos.sh ] && source ~/.zshrc.d/macos.sh;;
esac

[ -f ~/.zshrc.local.sh ] && source ~/.zshrc.local.sh
#turn of correct
unsetopt correct_all
if [ -e /Users/frank/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/frank/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
