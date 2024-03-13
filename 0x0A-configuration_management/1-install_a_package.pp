#!/usr/bin/pup
# Install flask (version: 2.1.0) using Puppet.

package {'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
