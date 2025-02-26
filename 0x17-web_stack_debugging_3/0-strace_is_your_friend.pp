# Changes phpp to php in a file that caused 500 server error
service { 'apache2':
  ensure => 'running',
  enable => true,
}

exec { 'Fixing 500 error':
  command  => 'sudo sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  provider => shell,
}
