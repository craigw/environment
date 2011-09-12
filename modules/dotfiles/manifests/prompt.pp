class dotfiles::prompt {
  include dotfiles::profile

  file { '/home/craig/.prompt':
    ensure => 'present',
    source => 'puppet:///modules/dotfiles/prompt'
  }

  file { '/home/craig/.profile.d/prompt':
    ensure => link,
    target => '/home/craig/.prompt',
    require => File['/home/craig/.profile.d']
  }
}
