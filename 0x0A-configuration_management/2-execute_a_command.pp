# Kills a process named killmenow using Puppet.

exec { 'pkill -f killmenow':
  command     => 'pkill -f killmenow',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
}
