# Installs and configures an Nginx web server using Puppet.

package { 'nginx':
    ensure => installed,
}

exec {'Defautl page':
    command => "sudo echo 'Hello World!' > /var/www/html/index.html",
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

exec { 'redirection configuration':
    command => "sed -i 's/location \/ {/location \/redirect_me {/; s/try_files \$uri \$uri\/ =404;/return 301 https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4;/' /etc/nginx/sites-available/default",
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

exec { 'Restart Nginx':
    command => 'service nginx restart',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
