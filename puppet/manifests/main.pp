
class { 'docker':
  manage_kernel => false,
}

class { 'packer':
  install_dir => '/opt/packer',
  version => '0.6.0',
}->

file { '/usr/bin/packer':
  ensure => 'link',
  target => '/opt/packer/packer',
}

package { 'zip':
  ensure => 'installed',
}->

class { 'nodejs':
  manage_repo => true,
}->

file { '/usr/bin/node':
  ensure => 'link',
  target => '/usr/bin/nodejs',
}->

package { 'lepew-penelope':
  ensure   => 'installed',
  provider => 'npm'
}
