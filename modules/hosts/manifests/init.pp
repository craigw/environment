class hosts {
  file { '/etc/hosts':
    ensure => present,
    content => template('hosts/hosts.erb')
  }
}

