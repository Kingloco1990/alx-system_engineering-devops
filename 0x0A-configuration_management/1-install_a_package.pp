# Install flask (version: 2.1.0) using Puppet.

package { 'python3.8':
  ensure => '3.8.10',
}

package { 'python3-pip':
  ensure => installed,
}

package { 'flask':
  ensure   => '2.1.0',
  require  => Package['python3-pip'],
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.1.1',
  require  => Package['python3-pip'],
  provider => 'pip3',
}
