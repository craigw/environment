class virtualbox {
  include "curl"

  package { 'libqt4-opengl':
    ensure => installed
  }

  exec { 'download virtualbox package':
    command => '/usr/bin/curl  "http://download.virtualbox.org/virtualbox/4.1.2/virtualbox-4.1_4.1.2-73507~Ubuntu~natty_amd64.deb" -LOq',
    creates => '/tmp/virtualbox-4.1_4.1.2-73507~Ubuntu~natty_amd64.deb',
    cwd => '/tmp',
    require => Package['curl']
  }

  exec { 'install virtualbox':
    command => '/usr/bin/dpkg -i /tmp/virtualbox-4.1_4.1.2-73507~Ubuntu~natty_amd64.deb',
    creates => '/usr/lib/virtualbox',
    require => [
      Exec['download virtualbox package'],
      Package['libqt4-opengl']
    ]
  }
}
