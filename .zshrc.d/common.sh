# Common function

alias e='emacsclient -c'
alias g='grep'

# Grabs the disk usage in the current directory
alias usage='du -ch 2> /dev/null |tail -1'
alias wget='wget -c'

alias sub='ls -d */'
alias l.='ls -d .*'

# cp /usr/share/vim/vim{version}/macros/less.sh /usr/local/bin/vless
alias v='/usr/local/bin/vless'
# alias c='rsync -av --progress'

# Find the files that has been added/modified most recently
alias lt='ls -alrt'

alias tree="tree -FAC | less -r"

alias serve="python3 -m http.server"
# or http-server
# https://github.com/indexzero/http-server

# Network
alias axel='axel -a'

alias rsync_remote_file="rsync --partial -azvv --progress $1 ."

count(){
    COUNT=`ls "$@" | wc -l`
    echo "FOUND $COUNT"
}

#pip install youtube-dl
alias ytb="youtube-dl $1 -f 37/22/35/34"

alias swap_capslock_to_ctrl='setxkbmap -layout us -option ctrl:nocaps'

# https://askubuntu.com/questions/17275/progress-and-speed-with-cp
alias cpp="rsync -ah --progress"

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

alias size='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

today(){
    TODAY=$(date '+%Y%m%d')
    if [ ! -d "$TODAY" ]; then
        mkdir $TODAY
    fi
    cd $TODAY
}
