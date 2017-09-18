# Text search

function find_lines_contains_string_in_current_folder_recursively() {
    find . -name "*" -type f | xargs grep "$1" --line-number 
}
alias fl=find_lines_contains_string_in_current_folder_recursively

function find_files() { 
    find . -name "*$1*" -print
}
alias ff=find_files
