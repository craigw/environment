class ssh {
  package { 'ssh':
    ensure => installed
  }
  # TODO: Setup SSH agent system-wide  
}
