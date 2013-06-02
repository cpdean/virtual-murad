sudo apt-get install gcc build-essential libssl-dev libreadline5-dev zlib1g-dev linux-headers-generic libsqlite3-dev

wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p0.tar.gz

tar -xvzf ruby-1.9.2-p0.tar.gz

cd ruby-1.9.2-p0/

./configure --prefix=/usr/local/ruby

make && sudo make install

echo "PATH=/var/lib/gems/1.8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/ruby/bin:$PATH" >> ~/.bashrc

sudo ln -s /usr/local/ruby/bin/ruby /usr/local/bin/ruby

sudo ln -s /usr/local/ruby/bin/gem /usr/bin/gem

sudo apt-get install libopenssl-ruby

wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.12.tgz

tar -xvzf rubygems-1.8.12.tgz

cd rubygems-1.8.12

sudo ruby setup.rb

sudo gem install rubygems-update

cd /var/lib/gems/1.8/bin/

sudo ./update_rubygems

sudo gem install rails

bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

echo '-s "/home/deploy/.rvm/scripts/rvm" && source "/home/deploy/.rvm/scripts/rvm"' >> ~/.profile

rvm install 1.9.3

apt-get install ruby1.9.3

apt-get install rubygems1.9.3

update-alternatives --install /usr/bin/ruby ruby /usr/local/bin/ruby 500 --slave /usr/bin/irb irb /usr/local/ruby/bin/irb

sudo apt-get -y install tcsh git-core scons g++

sudo apt-get -y install libpcre++-dev libboost-dev libreadline-dev

sudo apt-get -y install libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev libboost-date-time-dev

sudo apt-get install imagemagick --fix-missing

sudo apt-get remove xulrunner-1.9.2-dev xulrunner-1.9.2

sudo apt-get install curl

#curl -O ftp://ftp.mozilla.org/pub/mozilla.org/js/js-1.7.0.tar.gz

#tar zxvf js-1.7.0.tar.gz

#cd js/src

#export CFLAGS="-DJS_C_STRINGS_ARE_UTF8"

#sudo apt-get install make

#sudo make -f Makefile.ref

#sudo JS_DIST=/usr make -f Makefile.ref export

#sudo apt-get install libqt4-dev pandoc

git clone git://github.com/mongodb/mongo.git

cd mongo

git checkout r2.0.0

scons all

sudo scons --prefix=/usr/local install

sudo mkdir /data

sudo mkdir /data/db

cd mongo

sudo apt-get install screen

sudo screen ./mongod
