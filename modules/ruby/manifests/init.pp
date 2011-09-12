class ruby {
  include curl
  include git

  package { 'ruby':
    ensure => installed
  }

  package { 'rubygems':
    ensure => installed,
    require => Package['ruby']
  }

  exec { 'install rvm':
    command => '/bin/bash < <( /usr/bin/curl https://rvm.beginrescueend.com/releases/rvm-install-head )',
    creates => '/usr/local/rvm',
    require => [
      Package['curl'],
      Package['git-core']
    ]
  }

  package {
    'build-essential':
      ensure => installed;
    'bison':
      ensure => installed;
    'openssl':
      ensure => installed;
    'libreadline6':
      ensure => installed;
    'libreadline6-dev':
      ensure => installed;
    'zlib1g':
      ensure => installed;
    'zlib1g-dev':
      ensure => installed;
    'libssl-dev':
      ensure => installed;
    'libyaml-dev':
      ensure => installed;
    'libsqlite3-0':
      ensure => installed;
    'libsqlite3-dev':
      ensure => installed;
    'sqlite3':
      ensure => installed;
    'libxml2-dev':
      ensure => installed;
    'libxslt1-dev':
      ensure => installed;
    'autoconf':
      ensure => installed;
    'libc6-dev':
      ensure => installed;
    'libncurses5-dev':
      ensure => installed;
    'automake':
      ensure => installed;
  }

  exec { 'install ruby-1.9.2-p180':
    command => '/usr/local/rvm/bin/rvm install ruby-1.9.2-p180',  
    creates => '/usr/local/rvm/rubies/ruby-1.9.2-p180',
    require => [
      Package['git-core'],
      Package['curl'],
      Package['build-essential'],
      Package['bison'],
      Package['openssl'],
      Package['libreadline6'],
      Package['libreadline6-dev'],
      Package['zlib1g'],
      Package['zlib1g-dev'],
      Package['libssl-dev'],
      Package['libyaml-dev'],
      Package['libsqlite3-0'],
      Package['libsqlite3-dev'],
      Package['sqlite3'],
      Package['libxml2-dev'],
      Package['libxslt1-dev'],
      Package['autoconf'],
      Package['libc6-dev'],
      Package['libncurses5-dev'],
      Package['automake'],
      Exec['install rvm']
    ],
    timeout => 0
  }

  exec { 'make ruby-1.9.2-p180 the system default':
    command => '/usr/local/rvm/bin/rvm --default ruby-1.9.2-p180',
    unless => '/usr/bin/test "`/bin/readlink -f /usr/local/rvm/rubies/default`" = "/usr/local/rvm/rubies/ruby-1.9.2-p180"'
  }
}
