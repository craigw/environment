class dotfiles::aliases {
  include dotfiles::profile

  file { '/home/craig/.aliases':
    ensure => 'present',
    source => 'puppet:///modules/dotfiles/aliases'
  }

  file { '/home/craig/.profile.d/aliases':
    ensure => link,
    target => '/home/craig/.aliases',
    require => File['/home/craig/.profile.d']
  }
}
