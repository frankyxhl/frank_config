# Text search
[ -f ~/.zshrc.d/lib.sh ] && source ~/.zshrc.d/lib.sh

find_lines_contains_string_in_current_folder_recursively() {
    if [ $# -eq 0 ] ; then
        echo "Please input the content you want to search."
        echo "For example: find bar"
        return
    fi
    if command_exists rg ; then
        rg "$1"
    else
        find . -name "*" -type f | xargs grep "$1" --line-number
    fi
}
alias fl=find_lines_contains_string_in_current_folder_recursively

find_files() {
    if [ $# -eq 0 ] ; then
        echo "Please input the file names you want to search."
        echo "For example: find bar"
        return
    fi
    if [ "$1" = "--help" ] ; then
        echo "ff Find files"
        echo "For example: find bar"
        return
    fi
    find . -iname "*$1*" -type f -print
}
alias ff=find_files
