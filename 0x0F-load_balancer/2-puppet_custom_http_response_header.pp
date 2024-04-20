# Installs and configures an Nginx web server using Puppet.

exec {'Update':
    command => '/usr/bin/apt-get update',
}

package { 'nginx':
    ensure => installed,
}

file_line { 'header_served_by':
    path  => '/etc/nginx/sites-available/default',
    match => '^server {',
    line  => "server {\n\tadd_header X-Served-By \"${hostname}\";",
    multiple => false,
}

exec { 'Restart Nginx':
    command => 'service nginx restart',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
