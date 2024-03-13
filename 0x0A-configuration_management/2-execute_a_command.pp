# Kills a process named killmenow using Puppet.

exec { 'killmenow':
  command => 'pkill  killmenow',
  path    => ['/bin', '/usr/bin'],
}
