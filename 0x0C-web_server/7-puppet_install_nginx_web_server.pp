# Installs and configures an Nginx web server using Puppet.

exec { 'Update package lists':
    command => 'apt-get update',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

package { 'nginx'
    comman => 'apt-get install -y nginx',
    ensure => installed,
}

file { '/var/www/html/index.html':
    ensure  => 'file',
    path    => '/var/www/html/index.html',
    content => 'Hello World!',
    mode    => '0744',
}

exec { 'redirection configuration':
    command => "sed -i 's/location \/ {/location \/redirect_me {/; s/try_files \$uri \$uri\/ =404;/return 301 https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4;/' /etc/nginx/sites-available/default",
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

exec { 'Restart Nginx':
    command => 'service nginx restart',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
