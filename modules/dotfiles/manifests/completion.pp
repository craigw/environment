class dotfiles::completion {
  file { '/home/craig/.completion':
    ensure => present,
    source => 'puppet:///modules/dotfiles/completion'
  }

  file { '/home/craig/.profile.d/completion':
    ensure => link,
    target => '/home/craig/.completion',
    require => File['/home/craig/.profile.d']
  }
}
