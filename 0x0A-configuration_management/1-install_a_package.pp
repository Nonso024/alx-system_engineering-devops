# script that install flask from pip3

package { 'python3-pip':
  ensure => installed,
}
exec { 'install-flask-2.1.0':
  command => '/usr/bin/pip3 install flask==2.1.0',
  path    => ['/usr/bin'],
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
  require => Package['python3-pip'],
}
