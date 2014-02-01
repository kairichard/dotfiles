sudo apt-get purge vim
sudo apt-get install mercurial build-essential ncurses-dev
sudo apt-get install python-dev
sudo apt-get install build-essential cmake

cd /tmp
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
make distclean
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp
make
sudo make install
