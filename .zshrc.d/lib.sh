# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script#answer-4785518
command_exists () {
    type "$1" &> /dev/null ;
}
