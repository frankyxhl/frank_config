# git command alias

# goto current git project root path
alias git-root='cd $(git rev-parse --show-cdup)'
alias git-diff-with-last-version="git icdiff HEAD^ HEAD"

# https://stackoverflow.com/questions/5361019/viewing-full-version-tree-in-git
# alias git-tree="git log --pretty=oneline --graph --decorate --all"
alias git-log='git log --oneline --decorate --graph'
alias git-tree='git log --oneline --decorate --graph'


# https://stackoverflow.com/questions/13541615/how-to-remove-files-that-are-listed-in-the-gitignore-but-still-on-the-repositor#answer-36573710
# Perform a dry run and see what will be removed
alias git_clean_test_exclude_files_from_git_ignore="git clean -xdn"
# Execute it
alias git_clean_xclude_files_from_git_ignore="git clean -xdf"
