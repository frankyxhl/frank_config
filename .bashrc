PS1="╭─ \[\033]0;$TITLEPREFIX:$PWD\007\]\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]
╰─λ "

find_lines_contains_string_in_current_folder_recursively() {
    find . -name "*" -type f | xargs grep "$1" --line-number
}
alias fl=find_lines_contains_string_in_current_folder_recursively

find_files() {
    find . -iname "*$1*" -type f -print
}
alias ff=find_files

alias cls=clear

export EDITOR=vim
