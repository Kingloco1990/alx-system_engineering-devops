# Installs and configures an Nginx web server.

# Install Nginx package
package { 'nginx':
    ensure => installed,  # Ensure that the Nginx package is installed on the system
}

# Configure custom HTTP header in Nginx
exec { 'custom HTTP header':
    command => "sed -i 's/root \/var\/www\/html;/root \/var\/www\/html;\n\n\tadd_header X-Served-By $HOSTNAME;/' /etc/nginx/sites-available/default",
    path    => ['/bin', '/usr/bin', '/usr/sbin'],  # Set the path for the command execution
}

# Restart Nginx service to apply changes
exec { 'Restart Nginx':
    command => 'service nginx restart',  # Restart the Nginx service
    path    => ['/bin', '/usr/bin', '/usr/sbin'],  # Set the path for the command execution
}
