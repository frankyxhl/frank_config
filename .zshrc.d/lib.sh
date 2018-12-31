# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script#answer-4785518
command_exists () {
    type "$1" &> /dev/null ;
}

# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux#answer-3466183
get_os_name(){
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     OS_NAME=Linux;;
        Darwin*)    OS_NAME=Mac;;
        CYGWIN*)    OS_NAME=Cygwin;;
        MINGW*)     OS_NAME=MinGw;;
        *)          OS_NAME="UNKNOWN:${unameOut}"
    esac
    echo ${OS_NAME}
}

