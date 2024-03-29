$apt_packages = [
    "vim",
    "git",
    "curl",
    # build ruby
    "gcc",
    "build-essential",
    "libssl-dev",
    "libreadline5-dev",
    "zlib1g-dev",
    "linux-headers-generic",
    "libsqlite3-de",
    # for some reason after build ruby
    # but before install rubygems
    "libopenssl-ruby",
]

$vagrant_path = [
    "/usr/local/sbin",
    "/usr/local/bin",
    "/usr/sbin",
    "/usr/bin",
    "/sbin",
    "/bin",
    "/usr/games",
    "/opt/vagrant_ruby/bin",
]


File {
    owner  => "vagrant",
    group => "vagrant",
    mode  => 0644,
}

Exec {
    user  => "vagrant",
    group => "vagrant",
    path  => $vagrant_path,
}

exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    user    => 'root',
    group   => 'root',
}

file { '/home/vagrant/install_files':
    ensure => directory,
}

exec { 'download ruby source':
    command => 'wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p0.tar.gz',
    cwd     => '/home/vagrant/install_files',
    creates => '/home/vagrant/install_files/ruby-1.9.2-p0.tar.gz',
}

exec { 'untar ruby':
    require  => Exec['download ruby source'],
    command  => 'tar -xvzf ruby-1.9.2-p0.tar.gz',
    cwd      => '/home/vagrant/install_files',
    creates  => '/home/vagrant/install_files/ruby-1.9.2-p0',
}

exec { 'config ruby':
    require  => Exec['untar ruby'],
    command  => '/home/vagrant/install_files/ruby-1.9.2-p0/configure --prefix=/usr/local/ruby',
    cwd      => '/home/vagrant/install_files/ruby-1.9.2-p0',
}

exec { 'build ruby':
    require  => [Package['build-essential'], Package['gcc'], Exec['untar ruby']],
    command  => 'make && sudo make install',
    cwd      => '/home/vagrant/install_files/ruby-1.9.2-p0',
}

/*
file_line { "add ruby path":
    path    => "/home/vagrant/.bashrc",
    line    => "PATH=/var/lib/gems/1.8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/ruby/bin:\$PATH",
}
*/

file { "/usr/local/ruby/bin/ruby":
    ensure => 'link',
    target => '/usr/local/bin/ruby',
}

package { $apt_packages:
    ensure  => present,
    require => Exec['apt-get update'],
}
