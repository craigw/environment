class dotfiles::top {
  file { '/home/craig/.toprc':
    ensure => 'present',
    source => 'puppet:///modules/dotfiles/toprc'
  }
}
