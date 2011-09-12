class dotfiles::git {
  file { '/home/craig/.gitignore':
    ensure => 'present',
    source => 'puppet:///modules/dotfiles/gitignore'
  }

  file { '/home/craig/.gitconfig':
    ensure => 'present',
    source => 'puppet:///modules/dotfiles/gitconfig'
  }
}
