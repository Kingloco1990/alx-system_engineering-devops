# Installs and configures an Nginx web server using Puppet.

# Install the Nginx package
package { 'nginx':
    ensure => installed, # Ensure that the package is installed
}

# Define a fact to fetch the hostname
$hostname = $facts['hostname']

# Use exec resource to substitute text in the NGINX configuration file
exec { 'custom HTTP header':
    environment => ["HOST=${hostname}"], # Set environment variable for the hostname
    command => "sed -i 's/root \/var\/www\/html;/root \/var\/www\/html;\n\n\tadd_header X-Served-By $HOST;/' /etc/nginx/sites-available/default", # Command to substitute text in NGINX config file
    path    => ['/bin', '/usr/bin', '/usr/sbin'], # Set the path for command execution
}

# Define an Exec resource to restart Nginx service
exec { 'Restart Nginx':
    command => 'service nginx restart', # Command to restart Nginx service
    path    => ['/bin', '/usr/bin', '/usr/sbin'], # Set the path for command execution
}
