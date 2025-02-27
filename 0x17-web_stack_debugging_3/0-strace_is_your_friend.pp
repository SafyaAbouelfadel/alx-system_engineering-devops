# Puppet manifest to fix Apache 500 error

exec { 'install_php_module':
  command => '/usr/bin/apt-get install -y php libapache2-mod-php',
  path    => ['/usr/bin', '/usr/sbin'],
  onlyif  => 'test ! -f /usr/lib/apache2/modules/libphp7.so',
}

exec { 'set_permissions':
  command => '/bin/chown -R www-data:www-data /var/www/html && /bin/chmod -R 755 /var/www/html',
  path    => ['/bin', '/usr/bin'],
  onlyif  => 'test $(stat -c "%U" /var/www/html) != "www-data"',
}

exec { 'restart_apache':
  command   => '/usr/sbin/service apache2 restart',
  path      => ['/usr/sbin', '/bin', '/usr/bin'],
  subscribe => Exec['install_php_module'],
}
