class gnome {
  package { 'gnome':
    ensure => installed
  }

  service { 'gdm':
    ensure => running,
    require => Package['gnome']
  }

  file {
    '/home': ensure => present;
    '/home/craig': ensure => present;
    '/home/craig/.gconf': ensure => present;
    '/home/craig/.gconf/apps': ensure => present;
    '/home/craig/.gconf/apps/gnome-terminal': ensure => present;
    '/home/craig/.gconf/apps/gnome-terminal/profiles': ensure => present;
    '/home/craig/.gconf/apps/gnome-terminal/profiles/Default': ensure => present;
    '/home/craig/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml':
      ensure => present,
      source => 'puppet:///modules/gnome/gnome-terminal.xml',
      mode => 0600
  }
}

