class dotfiles::profile {
  file { '/home/craig/.profile.d':
    ensure => directory
  }

  file { '/home/craig/.bashrc':
    ensure => present,
    source => 'puppet:///modules/dotfiles/bashrc'
  }

  file { '/home/craig/.profile':
    ensure => present,
    source => 'puppet:///modules/dotfiles/profile'
  }
}
