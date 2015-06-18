echo 'Building VIM7.4'
sudo apt-get purge --yes vim
sudo apt-get install --yes mercurial ncurses-dev python-dev
sudo apt-get install --yes build-essential cmake ack-grep exuberant-ctags
sudo apt-get install --yes htop

cd /tmp
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
make distclean
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp
make
sudo make install

echo 'Installing rbenv'
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
