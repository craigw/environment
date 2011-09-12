class gnome {
  package { 'gnome':
    ensure => installed
  }

  service { 'gdm':
    ensure => running,
    require => Package['gnome']
  }
}

