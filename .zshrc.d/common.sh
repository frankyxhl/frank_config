# Common function
[ -f ~/.zshrc.d/lib.sh ] && source ~/.zshrc.d/lib.sh

# Alias
alias e="emacsclient -a ''"
alias g='git'

# let Cal show 3 months in default
alias cal='cal -3'
alias wget='wget -c'
alias cls='clear'


# ls command enhancement

# ls folders only
alias sub='ls -d */'
alias ld='ls -d */'

# List dotfiles only
alias l.='ls -d .*'

# https://unix.stackexchange.com/questions/125385/combined-mkdir-and-cd#answer-125386
mc ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

# List ordered by time
alias lt='ls -alrt'

# cp /usr/share/vim/vim{version}/macros/less.sh /usr/local/bin/vless
alias v='/usr/local/bin/vless'
# alias c='rsync -av --progress'

# Find the files that has been added/modified most recently

alias tree="tree -FAC | less -r"

alias serve="python3 -m http.server"
# or http-server
# https://github.com/indexzero/http-server

# Network
alias axel='axel -a'

alias rsync_remote_file="rsync --partial -azv --progress $1 ."

count-files(){
    COUNT=`ls "$@" | wc -l`
    echo "$COUNT files found."
}

alias count-file-lines='wc -l'

#pip install youtube-dl
alias ytb="youtube-dl $1 -f 37/22/35/34"

alias swap-capslock-to-ctrl='setxkbmap -layout us -option ctrl:nocaps'

# https://askubuntu.com/questions/17275/progress-and-speed-with-cp
alias cpp="rsync --archive --human-readable --progress --partial"

mvbk() {
    mv $1 $1.bak
}
cpbk() {
    cp $1 $1.bak
}
alias mvbk=mvbk
alias cpbk=cpbk


# https://github.com/mitchellh/vagrant/issues/4412
alias vagrant_box_update_and_remove_old='curl -LSs http://bit.ly/box-update-all | bash'

alias wget-website='wget \
    --recursive \
    --no-clobber \
    --page-requisites \
    --html-extension \
    --convert-links \
    --restrict-file-names=windows \
    --no-parent \ '

# Grabs the disk usage in the current directory
alias usage='du -ch 2> /dev/null |tail -1'

alias size='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

alias disk='df -h'

today(){
    TODAY=$(date '+%Y%m%d')
    if [ ! -d "$TODAY" ]; then
        mkdir $TODAY
    fi
    cd $TODAY
}

color_ll(){
    if command_exists exa ; then
        exa -l $@
    else
        ls -lh $@
    fi
}
alias ll=color_ll

color_ls(){
    if command_exists exa; then
        exa $@
    else
        ls $@
    fi
}
alias ls=color_ls
alias l=color_ls

# https://github.com/sharkdp/bat
cat_or_bat(){
    if command_exists bat; then
        alias cat='bat'
    fi
}

# cat_or_bat

# More color: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
export LS_COLORS=$LS_COLORS:'di=1;34:'

# Use vi as default editor
export EDITOR=vi


# https://www.jianshu.com/p/c5a2369fa613
# COMMAND # (wget -O - pi.dk/3 || curl pi.dk/3/) | bash
alias p='parallel'
alias pp='parallel --pipe -k'
