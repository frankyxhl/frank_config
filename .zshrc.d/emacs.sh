# Tramp password hang bug
# Put below line at your bottom of your .zshrc file
# [ -f .zshrc.d/emacs.sh ] && source .zshrc.d/emacs.sh
# https://stackoverflow.com/questions/19771363/emacs-tramp-hangs-on-enter-key-after-inputing-password
if [[ "$TERM" == "dumb" ]]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi
