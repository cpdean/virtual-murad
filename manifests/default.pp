$apt_packages = [
    "vim",
    "git",
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

exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    user    => 'root',
    group   => 'root',
}

Exec {
    user  => "vagrant",
    group => "vagrant",
    path  => $vagrant_path,
}

package { $apt_packages:
    ensure  => present,
    require => Exec['apt-get update'],
}
