# Installs and configures an Nginx web server using Puppet.

package { 'nginx':
    ensure => installed,
}

exec { 'add_header':
  provider    => shell,
  environment => ["HOST=${hostname}"],
  command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
  before      => Exec['restart Nginx'],
}

# Define an Exec resource to restart Nginx service
exec { 'Restart Nginx':
    command => 'service nginx restart',
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
