sudo apt update
sudo apt install -y autoconf automake m4 libtool libevent perl pkg-config libevent-dev libncurses5-dev
sh autogen.sh
./configure && make
