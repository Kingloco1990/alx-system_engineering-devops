# Installs and configures an Nginx web server using Puppet.

exec { 'apt-get-update':
    command => '/usr/bin/apt-get update',
}

package { 'nginx':
    ensure  => installed,
    require => Exec['apt-get-update'],
}

file { '/var/www/html/index.html':
    content => 'Hello World!',
}

file_line { 'redirection configuration':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default_server;',
    line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
    require => Package['nginx'],
}

file_line { 'add custom header':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'root /var/www/html;',
    line    => 'add_header X-Served-By $hostname;',
    require => Package['nginx'],
}

exec { 'Restart Nginx':
    command => 'service nginx restart',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
