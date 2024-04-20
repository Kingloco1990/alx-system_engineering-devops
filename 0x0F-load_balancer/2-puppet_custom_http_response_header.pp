# Installs and configures an Nginx web server using Puppet.

exec { 'Update the package lists':
    command => 'apt-get update',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

package { 'nginx':
    ensure => installed,
}

file_line { 'Add custom HTTP header':
    path  => '/etc/nginx/sites-available/default',
    match => '/root \/var\/www\/html;',
    line  => '/root \/var\/www\/html;\n\n\tadd_header X-Served-By $HOSTNAME;/',
    multiple => false,
}

exec { 'Restart Nginx':
    command => 'service nginx restart',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
